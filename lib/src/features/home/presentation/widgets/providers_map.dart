part of '../imports/presentaion_imports.dart';

class CustomGoogleMaps extends StatefulWidget {

  final List<Providers> providers;
  const CustomGoogleMaps({super.key,
    required this.providers,
  });

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late GoogleMapController mapsController;

  late List<LatLng> latLngList ;

  List<LatLng> get markers{
    latLngList = [];
    for(int i = 0; i < widget.providers.length; i++){
      LatLng latLng = LatLng(
          widget.providers[i].locations[0].lat?.toDouble()??0,
          widget.providers[i].locations[0].lng?.toDouble()??0
      );
      latLngList.add(latLng);
    }
    return latLngList;
  } // if has single location

 //  List<LatLng> get markers{
  //   latLngList = [];
  //   for(int i = 0; i < widget.providers.length; i++){
  //     for(Locations locationForProvider in widget.providers[i].locations){
  //       LatLng latLng = LatLng(
  //           locationForProvider.lat??0,
  //           locationForProvider.lng??0
  //       );
  //       latLngList.add(latLng);
  //     }
  //   }
  //
  //   return latLngList;
  // } // if has multiply locations

  final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100,
      timeLimit: 30.seconds
  );

  Future<void> getInitialCameraPositionBasedUserPosition() async {
    late Position position;
    try {
      position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    } catch (e) {
      log('error :$e');
    }
    initialCameraPosition = LatLng(position.longitude, position.longitude);
    animatedCameraPositionBasedLatLng();
  }

  Future<void> animatedCameraPositionBasedLatLng()async{
    await mapsController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: initialCameraPosition,
            zoom: 6,
          ),
        ));
  }

  late LatLng initialCameraPosition;

  bool isLoading = false;
  Set<Marker> customMarkers = {};

  // Future<void> _loadMarkers() async {
  //   setState(() => isLoading = true);
  //   final List<Marker> markersList = [];
  //
  //   for (var i = 0; i < widget.providers.length; i++) {
  //     final provider = widget.providers[i];
  //     final markerIcon = await convertToBitmap(provider);
  //     markersList.add(
  //       Marker(
  //         infoWindow: InfoWindow(
  //             title: provider.name,
  //             onTap: () => Go.to( PlaceDetails(providerId: provider.id))
  //         ),
  //         markerId: MarkerId(provider.id.toString()),
  //         icon: markerIcon,
  //         position: LatLng(
  //           provider.locations[0].lat?.toDouble() ?? 0.0,
  //           provider.locations[0].lng?.toDouble() ?? 0.0,
  //         ), // Assuming you have a LatLng here
  //       ),
  //     );
  //   }
  //   customMarkers = markersList.toSet();
  //   setState(() => isLoading = false);
  // }
  //
  // Future<BitmapDescriptor> convertToBitmap(Providers provider)async{
  //   return await ProviderMarker(provider: provider).toBitmapDescriptor(
  //     logicalSize: const Size(150, 150),
  //     imageSize: const Size(150, 150),
  //   );
  // }

  final _cachedMapMarker = CachedMapMarker();
  Future<void> _loadMarkers() async {
    final List<Marker> markers = [];
    setState(() => isLoading = true);
    for (Providers provider in widget.providers) {
      if (provider.locations.isEmpty ||
          provider.locations[0].lat == null ||
          provider.locations[0].lng == null) {
        continue;
      }

      BitmapDescriptor marker = await generateBitmapFormatMarkers(provider);
      final networkMarker = generateAbsoluteMarker(provider: provider, marker: marker);
      markers.add(networkMarker);
    }

    customMarkers = Set.from(markers.toSet());
    setState(() => isLoading = true);
  }

  Future<BitmapDescriptor> generateBitmapFormatMarkers(Providers provider) async {
    await _cachedMapMarker.clearCache();
    return await _cachedMapMarker.fromWidget(
      widget: ProviderMarker(provider: provider),
      waitToRender: const Duration(seconds: 1),
      cacheKey: 'provider_${provider.id}',
      logicalSize: const Size(150, 150),
      imageSize: const Size(80, 80),
    );
  }

  Marker generateAbsoluteMarker({
    required Providers provider,
    required BitmapDescriptor marker
  }){
    return Marker(
      infoWindow: InfoWindow(
          title: provider.name,
          onTap: () => Go.to( PlaceDetails(providerId: provider.id))
      ),
      markerId: MarkerId(provider.id.toString()),
      position: LatLng(
        provider.locations[0].lat!.toDouble(),
        provider.locations[0].lng!.toDouble(),
      ),
      icon: marker,
    );
  }

  @override
  void initState() {
    _loadMarkers();
    getInitialCameraPositionBasedUserPosition();
    super.initState();
  }
  @override
  void dispose() {
    mapsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          AppText(
            LocaleKeys.serviceProviders,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),

          Expanded(
            child: GoogleMap(
              mapType: MapType.terrain,
              gestureRecognizers: {}
                ..add(Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())),
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (controller) => mapsController = controller,
              initialCameraPosition: const CameraPosition(target: LatLng(31, 31), zoom: 5),
              markers: customMarkers

              // markers: state.markers?.toSet() ?? {}
              // markers: List.generate(
              //     markers.length,
              //         (index) => Marker(
              //             infoWindow: InfoWindow(
              //                 title: widget.providers[index].name,
              //                 onTap: () => Go.to( PlaceDetails(providerId: widget.providers[index].id))
              //             ),
              //             markerId: MarkerId(index.toString()),
              //             position: latLngList[index]
              //     )).toSet()
            )
          ),
        ],
      ),
    );
  }
}