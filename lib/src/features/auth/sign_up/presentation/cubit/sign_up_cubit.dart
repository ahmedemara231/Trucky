import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_base/src/features/auth/sign_up/data/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repo) : super(SignUpState.initial());
  SignUpRepo repo;

  Future<void> signUp(String phone)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.signUp(phone);
    result.when(
          (success) =>  emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                msg: success.message,
                model: success.data,
              )),
          (error) =>  emit(
              state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message,
                // model: success.data,
              )),
    );
  }

  Future<void> logout()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.logout();
    result.when(
          (success) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  msg: success.data
              )),
          (error) => emit(state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  Future<void> deleteAccount()async {
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.deleteAccount();
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.data
          )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }
}
