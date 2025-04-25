part of '../imports/data_imports.dart';

abstract interface class OtpRepo{
  Future<Result<BaseModel<UserResponse>, Failure>> sendCode({
    required SendOtpBody body,
  });
  Future<Result<BaseModel<RegisterResponse>, Failure>> resendCode(String phone);
}

class OtpRepositoryImpl implements OtpRepo {
  OtpDataSource otpDataSource;

  OtpRepositoryImpl({required this.otpDataSource});

  @override
  Future<Result<BaseModel<UserResponse>, Failure>> sendCode({
    required SendOtpBody body,
  }) async{
   return await otpDataSource
       .sendCode(body: body)
       .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<RegisterResponse>, Failure>> resendCode(String phone) async{
    return await otpDataSource.resendCode(phone).handleCallbackWithFailure();
  }
}