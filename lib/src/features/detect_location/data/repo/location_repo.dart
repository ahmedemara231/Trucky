part of '../imports/imports.dart';

abstract interface class LocationRepo{
  Future<Result<String, Failure>> storeLocation(StoreLocationModel model);
}

class LocationRepoImpl implements LocationRepo{
  final LocationDataSource locationDataSource;
  LocationRepoImpl(this.locationDataSource);

  @override
  Future<Result<String, Failure>> storeLocation(StoreLocationModel model) async{
    return locationDataSource.storeCurrentLocation(model).handleCallbackWithFailure();
  }

  // // Future<Result<void, Failure>> handleGetLocationProcess()async{
  // //   await Helpers.checkPermission(
  // //       PermissionProcessModel(
  // //         permissionClient: PermissionClient.location,
  // //         onPermissionGranted: ()async {
  // //           await getCurrentLocationOrGetError();
  // //           await getCurrentLocationBasedLatLngOrGetError();
  // //         },
  // //         onPermissionDenied: () => Go.back(),
  // //         messageOnDenied: LocaleKeys.cannotAccessLocation,
  // //       )
  // //   );
  // //
  // // }
  //
  // Future<Result<LatLng, Failure>> getCurrentLocationOrGetError() async{
  //   return await locationDataSource
  //       .getCurrentLocationOrThrow()
  //       .handleCallbackWithFailure();
  // }
  //
  // Future<Result<LocationModel, Failure>> getCurrentLocationBasedLatLngOrGetError()async{
  //   return await locationDataSource
  //       .getLocationBasedLatLngOrThrow()
  //       .handleCallbackWithFailure();
  // }
}