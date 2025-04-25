part of '../imports/imports.dart';

final class LocationState extends Equatable {
  final BaseStatus baseStatus;
  // final LocationModel? locationModel;
  // final LatLng? currentLatLng;
  // final GoogleMapController? controller;
  final String? msg;

  const LocationState({
    required this.baseStatus,
    this.msg = ConstantManager.emptyText,
  });

  factory LocationState.initial() {
    return const LocationState(
      baseStatus: BaseStatus.initial,
    );
  }

  LocationState copyWith({
    BaseStatus? baseStatus,
    String? msg,
  }) {
    return LocationState(
      baseStatus: baseStatus ?? this.baseStatus,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    msg
    // locationModel!,
    // errorMessage!,
  ];
}