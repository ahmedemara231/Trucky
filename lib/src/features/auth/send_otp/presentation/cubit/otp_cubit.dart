part of '../imports/imports.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this.repo) : super(OtpState.initial());
  OtpRepo repo;

  Future<void> sendOtp({
    required SendOtpBody body,
  })async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.sendCode(body: body);
    result.when(
          (success) => emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message,
              model: success.data,
          )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.error,
                  msg: error.message
              )),
    );
  }

  Future<void> resendCode(String phone)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.resendCode(phone);
    result.when(
          (success) =>  emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          )),
          (error) =>  emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }
}