part of '../imports/imports.dart';

abstract interface class SignUpRepo{
  Future<Result<BaseModel<RegisterResponse>, Failure>> signUp(String phone);
  Future<Result<BaseModel<String>, Failure>> logout();
  Future<Result<BaseModel<String>, Failure>> deleteAccount();
}

class SignUpRepoImpl implements SignUpRepo{

  SignUpDataSource signUpDataSource;
  SignUpRepoImpl({required this.signUpDataSource});

  @override
  Future<Result<BaseModel<RegisterResponse>, Failure>> signUp(String phone) {
    return signUpDataSource.signUp(phone).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> logout() async{
    return await signUpDataSource.logout().handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> deleteAccount()async {
    return await signUpDataSource.deleteAccount().handleCallbackWithFailure();
  }

  // @override
  // Future<Result<BaseModel<RegisterResponse>, Failure>> resendCode(String phone) async{
  //   return await signUpDataSource.resendCode(phone).handleCallbackWithFailure();
  // }
}