part of '../imports/imports.dart';

abstract interface class LocationDataSource{
  Future<String> storeCurrentLocation(StoreLocationModel model);
}
class LocationDataSourceImpl implements LocationDataSource{

  @override
  Future<String> storeCurrentLocation(StoreLocationModel model) async{
    log(model.toJson().toString());
    final result = await sl<NetworkService>().callApi(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.storeLocation,
          body: model.toJson(),
        )
    );

    return result.message;
  }

  // final LocationSettings locationSettings = const LocationSettings(
  //   accuracy: LocationAccuracy.best,
  //   distanceFilter: 100,
  // );
  //
  // LatLng currentLatLng = const LatLng(0, 0);
  // Future<LatLng> getCurrentLocationOrThrow()async{
  //   Position? position;
  //   try{
  //     position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  //     currentLatLng = LatLng(position.longitude, position.longitude);
  //     log('lat : ${position.latitude.toString()}');
  //     log(position.longitude.toString());
  //     return currentLatLng;
  //   }catch(e){
  //     position = await Geolocator.getLastKnownPosition();
  //     if(position == null){
  //       log('error :$e');
  //       throw Exception(LocaleKeys.cannotDetectYourLocation);
  //     }
  //     currentLatLng = LatLng(position.longitude, position.longitude);
  //     return currentLatLng;
  //   }
  // }
  //
  // LocationModel? locationModel;
  // Future<LocationModel> getLocationBasedLatLngOrThrow() async{
  //   try{
  //     List<Placemark> location = await placemarkFromCoordinates(
  //         currentLatLng.latitude,
  //         currentLatLng.longitude
  //     );
  //     locationModel = LocationModel.fromJson(location[0].toJson());
  //     for (var element in location) {
  //       log('location : ${element.toJson().toString()}');
  //     }
  //     return locationModel!;
  //   }catch(e){
  //     log('error is: $e');
  //     throw Exception(LocaleKeys.cannotDetectYourLocation);
  //   }
  // }
}