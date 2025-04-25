import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/config/res/constants_manager.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/models/user_data.dart';
import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/auth/sign_up/presentation/imports/imports.dart';
import '../../../error/exceptions.dart';
import '../../../helpers/cache_service.dart';
import '../../../navigation/navigator.dart';
import '../../../network/log_interceptor.dart';
import '../../../widgets/custom_messages.dart';

part 'user_state.dart';
part 'user_utils.dart';

const String _userKey = 'user';
const String _tokenKey = 'token';

class UserCubit extends Cubit<UserState> with UserUtils {
  UserCubit() : super(UserState.initial());

  void setToken(String token){
    sl<NetworkService>().setToken(token);
  }

  void removeToken(){
    sl<NetworkService>().removeToken();
  }

  void enableNeedActivation(){
    emit(state.copyWith(userStatus: UserStatus.needActivation));
  }

  void cleanUserData(){
    _clearUser();
  }

  Future<bool> checkTokenExistOrNot()async{
    final token = await SecureStorage.read(_tokenKey);
    log('token: ${token.toString()}');
    switch(token){
      case null:
      case "":
        return false;

      default:
        // sl<NetworkService>().setToken(token);
        // emit(state.copyWith(userModel: user, userStatus: UserStatus.loggedIn));
        return true;
    }
  }

  Future<void> setUserLoggedIn(
      {required UserData user, required String token}) async {
    await Future.wait([
      _saveUser(user),
      _saveToken(token),
    ]);
    setToken(token);
    emit(state.copyWith(userModel: user, userStatus: UserStatus.loggedIn)); // in otp and complete profile
  }

  // Future<void> checkUserModel()async{
  //   log(jsonDecode(CacheStorage.read('user')).toString());
  // }

  Future<void> handleLoggingOut(UnauthorizedException e)async{
    await logout();
    Go.offAll(const SignUp());
    MessageUtils.showSimpleToast(msg: e.message);
  }

  Future<void> logout() async {
    await Future.wait([
      CacheStorage.delete(_userKey),
      SecureStorage.delete(_tokenKey),
    ]);
    _clearUser();
  }

  Future<void> updateToken(String token) async {
    _saveToken(token);
  }

  Future<void> updateUser(UserData user) async {
    await _saveUser(user);
    emit(state.copyWith(userModel: user));
  }

  Future<bool> init() async {
    final Map<String, dynamic>? userMap =
        CacheStorage.read(_userKey, isDecoded: true);
    final token = await SecureStorage.read(_tokenKey);

    log('userMap $userMap, token $token');
    if (token != null && userMap != null) {
      setToken(token);
      emit(state.copyWith(
        userModel: UserData.fromJson(userMap),
        userStatus: UserStatus.loggedIn,
      ));
      return true;
    }
    return false;
  }

  void _clearUser() {
    sl<NetworkService>().removeToken();
    emit(UserState.initial());
  }

  UserData get user => state.userModel;
  static UserCubit get instance  => sl<UserCubit>();

  bool get isUserLoggedIn => state.userStatus == UserStatus.loggedIn;
  bool get isUserNeedActivation => state.userStatus == UserStatus.needActivation;
}
