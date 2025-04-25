part of '../imports/imports.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit(this.repo) : super(CompleteProfileState.initial());
  CompleteProfileRepo repo;

  Future<void> completeProfile(CompleteProfileRequest request)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.completeProfile(request);
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                msg: success.message,
                user: success.data
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.error,
                  msg: error.message
              )),
    );
  }
}