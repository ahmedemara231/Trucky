part of '../imports/data_imports.dart';

abstract interface class OtpDataSource{
  Future<BaseModel<UserResponse>> sendCode({
    required SendOtpBody body,
  });

  Future<BaseModel<RegisterResponse>> resendCode(String phone);
}

class OtpDataSourceImpl implements OtpDataSource{

  @override
  Future<BaseModel<UserResponse>> sendCode({
    required SendOtpBody body,
}) async{
    final result = await sl<NetworkService>().callApi(
        NetworkRequest(
            method: RequestMethod.post,
            path: UserCubit.instance.state.userStatus == UserStatus.needActivation?
            ApiConstants.activate : ApiConstants.verifyLogin,
            body: body.toJson(),
            queryParameters: UserCubit.instance.state.userStatus == UserStatus.needActivation? {
              '_method' : 'put'
            } : null,
        ),
      mapper: (json) => UserResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<RegisterResponse>> resendCode(String phone) async{
    final result = await sl<NetworkService>().callApi<RegisterResponse>(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.sendCode,
        body: {'phone': phone},
      ),
      mapper: (json) => RegisterResponse.fromJson(json),
    );

    return result;
  }
}