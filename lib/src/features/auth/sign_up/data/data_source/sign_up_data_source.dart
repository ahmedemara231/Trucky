part of '../imports/imports.dart';

abstract interface class SignUpDataSource{
  Future<BaseModel<RegisterResponse>> signUp(String phone);
  Future<BaseModel<String>> logout();
  Future<BaseModel<String>> deleteAccount();
}

class SignUpDataSourceImpl implements SignUpDataSource{
  @override
  Future<BaseModel<RegisterResponse>> signUp(String phone) async{
    final result = await sl<NetworkService>().callApi<RegisterResponse>(
      NetworkRequest(
            method: RequestMethod.post,
            path: ApiConstants.register,
            body: {'phone': phone},
        ),
      mapper: (json) => RegisterResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<String>> logout() async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
            method: RequestMethod.post,
            path: ApiConstants.logout,
        ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<String>> deleteAccount() async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
        method: RequestMethod.delete,
        path: ApiConstants.deleteAccount,
      ),
      mapper: (json) => json['msg'],
    );

    return result;
  }
}