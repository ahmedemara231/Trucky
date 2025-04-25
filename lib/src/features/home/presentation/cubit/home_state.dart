part of '../imports/presentaion_imports.dart';

final class HomeState extends Equatable {
  final BaseStatus baseStatus;
  final HomeDataModel? homeDataModel;
  final String errorMessage;
  final String pattern;

  const HomeState({
    required this.baseStatus,
    required this.homeDataModel,
    required this.pattern,
    this.errorMessage = ConstantManager.emptyText,
  });

  factory HomeState.initial() {
    return const HomeState(
      baseStatus: BaseStatus.initial,
      pattern: ConstantManager.emptyText,
      homeDataModel: null,
    );
  }

  HomeState copyWith({
    BaseStatus? baseStatus,
    HomeDataModel? homeDataModel,
    String? errorMessage,
    String? pattern,
    List<Marker>? markers
  }) {
    return HomeState(
      baseStatus: baseStatus ?? this.baseStatus,
      homeDataModel: homeDataModel?? this.homeDataModel,
      errorMessage: errorMessage ?? this.errorMessage,
      pattern: pattern?? this.pattern,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    homeDataModel,
    errorMessage,
    pattern,
  ];
}
