part of '../imports/imports.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit(this.locationRepo) : super(LocationState.initial());
  final LocationRepo locationRepo;

  Future<void> storeLocation(StoreLocationModel model)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await locationRepo.storeLocation(model);
    result.when(
          (success) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  msg: success
              )),
          (error) => emit(
              state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
              )),
    );
  }




  // Future<void> handleLocationProcess()async{
  //   final latLngResult = await locationRepo.getCurrentLocationOrGetError();
  //   latLngResult.when(
  //           (success) async{
  //                 (success) => emit(
  //                 state.copyWith(
  //                     baseStatus: BaseStatus.success,
  //                     currentLatLng: success
  //                 ));
  //             await getCurrentLocationBasedOnLatLng();
  //             changeCameraPosition(success);
  //           },
  //       (error) => emit(
  //           state.copyWith(
  //               baseStatus: BaseStatus.error,
  //               errorMessage: error.message
  //           )),
  //   );
  // }
  //
  // Future<void> getCurrentLocation()async{
  //   final result = await locationRepo.getCurrentLocationOrGetError();
  //   result.when(
  //           (success) => emit(
  //               state.copyWith(baseStatus: BaseStatus.success,
  //                 currentLatLng: success
  //               )),
  //         (error) => emit(
  //             state.copyWith(
  //                 baseStatus: BaseStatus.error,
  //                 errorMessage: error.message
  //             )),
  //   );
  // }
  //
  // Future<void> getCurrentLocationBasedOnLatLng()async{
  //   final result = await locationRepo.getCurrentLocationBasedLatLngOrGetError();
  //   result.when(
  //         (success) => emit(
  //             state.copyWith(
  //               baseStatus: BaseStatus.success,
  //               locationModel: success
  //             )),
  //         (error) => emit(
  //             state.copyWith(
  //                 baseStatus: BaseStatus.error,
  //                 errorMessage: error.message
  //             )),
  //   );
  // }
  //
  //
  // GoogleMapController? mapsController;
  // void initializeMap(GoogleMapController controller){
  //   mapsController = controller;
  //   // emit(state.copyWith(controller: controller));
  //   log('the cont : ${mapsController}');
  // }
  //
  // void changeCameraPosition(LatLng newLatLng){
  //   mapsController?.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(target: newLatLng, zoom: 16),
  //     ),
  //   );
  // }
}
