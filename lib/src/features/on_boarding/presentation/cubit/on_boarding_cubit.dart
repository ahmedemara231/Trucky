import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_base/src/features/on_boarding/data/repo/repo.dart';
import 'package:flutter_base/src/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(this.onBoardingRepo) : super(OnBoardingState.initial());
  OnBoardingRepo onBoardingRepo;

  Future<void> getOnBoardingData()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await onBoardingRepo.getOnBoardingData();
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                onBoardingResponse: success.data
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  errorMessage: error.message
              )),
    );
  }
}
