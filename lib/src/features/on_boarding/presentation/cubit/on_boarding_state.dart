import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/features/on_boarding/data/models/response.dart';
import '../../../../core/shared/base_state.dart';

final class OnBoardingState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;
  final OnBoardingResponse? onBoardingResponse;

  const OnBoardingState({
    required this.baseStatus,
    this.errorMessage = '',
    this.onBoardingResponse,
  });

  factory OnBoardingState.initial() => const OnBoardingState(
    baseStatus: BaseStatus.initial,
    onBoardingResponse: null
  );

  OnBoardingState copyWith({
    BaseStatus? baseStatus,
    String? errorMessage,
    OnBoardingResponse? onBoardingResponse
  }) =>  OnBoardingState(
    baseStatus: baseStatus ?? this.baseStatus,
    errorMessage: errorMessage ?? this.errorMessage,
    onBoardingResponse: onBoardingResponse?? this.onBoardingResponse
  );

  @override
  List<Object?> get props => [
    baseStatus,
    errorMessage,
    onBoardingResponse
  ];
}