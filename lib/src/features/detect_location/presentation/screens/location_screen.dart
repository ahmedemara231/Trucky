// part of '../imports/imports.dart';
//
// enum NavigationMethod{ push, pop }
// class LocationScreen extends StatelessWidget {
//
//   final NavigationMethod method;
//   const LocationScreen({super.key,
//     required this.method
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LocationCubit(sl<LocationRepo>()),
//       child: Scaffold(
//         body: _LocationBody(method: method),
//       ),
//     );
//   }
// }
//
//
// class _LocationBody extends StatefulWidget {
//   final NavigationMethod method;
//   const _LocationBody({super.key, required this.method});
//
//   @override
//   State<_LocationBody> createState() => _LocationBodyWithNamedState();
// }
//
// class _LocationBodyWithNamedState extends State<_LocationBody> {
//   final LocationSettings locationSettings = LocationSettings(
//       accuracy: LocationAccuracy.best,
//       distanceFilter: 100,
//       timeLimit: 30.seconds
//   );
//
//   bool isMapsLoading = false;
//
//   Future<void> handleLocationScreen()async{
//     await Helpers.checkPermission(
//         PermissionProcessModel(
//           permissionClient: PermissionClient.location,
//           onPermissionGranted: ()async => await handleGetLocationProcess(),
//           onPermissionDenied: () => Go.back(),
//           messageOnDenied: LocaleKeys.cannotAccessLocation,
//         )
//     );
//   }
//
//   Future<void> handleGetLocationProcess()async{
//     setState(() => isMapsLoading = true);
//     await getCurrentLatLng();
//     await getLocationBasedLatLng();
//     changeCameraPosition();
//     setState(() => isMapsLoading = false);
//   }
//
//   LatLng currentLatLng = const LatLng(0, 0);
//   Future<void> getCurrentLatLng()async{
//     late Position position;
//     try{
//       position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
//     }catch(e){
//       log('error :$e');
//     }
//     currentLatLng = LatLng(position.longitude, position.longitude);
//   }
//
//   Future<void> saveLastLocation()async => await CacheStorage.write(
//       CacheConstants.lastLocation,
//       locationModel?.toJson()
//   );
//
//   LocationModel? locationModel;
//   Future<void> getLocationBasedLatLng() async{
//     log('reFetching location');
//     List<Placemark> location = await placemarkFromCoordinates(
//         currentLatLng.latitude,
//         currentLatLng.longitude
//     );
//     locationModel = LocationModel.fromJson(location[0].toJson());
//     log('street : ${locationModel?.street.toString()}');
//   }
//
//   late GoogleMapController mapsController;
//   void changeCameraPosition(){
//     mapsController.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(target: currentLatLng, zoom: 16),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     handleLocationScreen();
//     searchController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     mapsController.dispose();
//     searchController.dispose();
//     super.dispose();
//   }
//
//   void changeUserLocation(LatLng newLatLng)async{
//     currentLatLng = newLatLng;
//     await getLocationBasedLatLng();
//     setState(() {});
//     log('setState');
//   }
//
//   void handleNullCurrentLocation(){
//     MessageUtils.showSimpleToast(msg: LocaleKeys.cannotDetectYourLocation, color: Colors.red);
//   }
//
//   late TextEditingController searchController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           GoogleMap(
//             mapType: MapType.terrain,
//             onTap: changeUserLocation,
//             onMapCreated: (controller) => mapsController = controller,
//             initialCameraPosition: const CameraPosition(target: LatLng(-100, -100), zoom: 5),
//             markers: {Marker(markerId: MarkerId(0.toString()), position: currentLatLng)},
//           ),
//           Align(
//             alignment: Alignment.topCenter,
//             child: DefaultTextField(
//               controller: searchController,
//               contentPadding: const EdgeInsets.all(16),
//               prefixIcon: SvgPicture.asset(Assets.iconsLocationMarker).paddingAll(12),
//               title: LocaleKeys.searchLocation,
//               fillColor: Colors.white,
//               filled: true,
//             ).paddingAll(10),
//           ),
//           ConfirmLocation(
//             location: locationModel?.street?? '',
//             onConfirmLocation: locationModel == null?
//                 () async=> handleNullCurrentLocation() :
//                 () async {
//               await context.read<LocationCubit>().storeLocation(
//                   StoreLocationModel(
//                     latLng: currentLatLng,
//                     mapDescription: locationModel?.street?? 'map description',
//                     address: locationModel?.street?? '',
//                   ));
//
//               switch(widget.method) {
//                 case NavigationMethod.push:
//                   Go.offAll(const HomeScreen());
//
//                 default:
//                   Navigator.pop(context, 'locationChanged');
//               }
//               await saveLastLocation();
//             },
//           ).paddingAll(20)
//         ],
//       ),
//     );
//   }
// // Future<void> finishSignUpProcess()async{
// //   await saveLastLocation();
// //   // await CacheStorage.write(CacheConstants.isLoggedIn, true);
// // }
// }