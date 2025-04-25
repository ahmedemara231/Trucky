part of '../imports/imports.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.repo) : super(ProfileState.initial());
  ProfileRepo repo;

  void putProfileDataFromCache(UserData user){
    emit(state.copyWith(baseStatus: BaseStatus.success, profileModel: user));
  }

  UserData? get userData => state.profileModel;

  Future<void> getProfile()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.fetchProfileData();
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                profileModel: success.data
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  msg: error.message
              )),
    );
  }
  Future<void> updateProfile({
    String? name,
    File? image,
})async{
    final result = await repo.updateProfile(name: name, image: image);
    result.when(
          (success) => emit(state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data.msg,
            userData: success.data.model
          )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.error,
                  msg: error.message
              )),
    );
  }

  Future<void> sendCodeToOldPhone(String phone)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.sendCodeToOldPhone(phone);
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data
        )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.error,
                  msg: error.message
              )),
    );
  }

  Future<void> sendCodeToNewPhone(String phone)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.sendCodeToNewPhone(phone);
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data
        )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  Future<void> verifyOldPhone({
    required String phone,
    required String code,
})async{
    final result = await repo.verifyOldPhone(phone: phone, code: code);
    result.when((success) => emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data
        )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message
          )),
    );
  }

  Future<void> verifyNewPhone({
    required String phone,
    required String code,
  })async{
    final result = await repo.verifyNewPhone(phone: phone, code: code);
    result.when((success) {
      emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data.msg,
            userData: success.data.userData
          ));
      cacheNewUserValue(success.data.userData);
    },
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message
          )),
    );
  }

  void cacheNewUserValue(UserData user){
    CacheStorage.write('user', jsonEncode(user));
  }
}
