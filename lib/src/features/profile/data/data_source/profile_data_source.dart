part of '../imports/imports.dart';

abstract class ProfileDataSource {
  Future<BaseModel<UserData>> fetchProfileData();
  Future<BaseModel<UpdateProfileModel>> updateProfile({
    String? name,
    File? image,
  });

  Future<BaseModel<String>> sendCodeToOldPhone(String phone);
  Future<BaseModel<String>> verifyOldPhone({
    required String phone,
    required String code,
});

  Future<BaseModel<String>> sendCodeToNewPhone(String phone);

  Future<BaseModel<UserResponse>> verifyNewPhone({
    required String phone,
    required String code,
  });
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<BaseModel<UserData>> fetchProfileData() async{
    final profileDataResult = await sl<NetworkService>().callApi<UserData>(
      NetworkRequest(
        method: RequestMethod.get,
        path: ApiConstants.getProfile,
      ),
      mapper: (json) => UserData.fromJson(json['data']),
    );

    return profileDataResult;
  }

  @override
  Future<BaseModel<UpdateProfileModel>> updateProfile({
    String? name,
    File? image,
}) async{
    final result = await sl<NetworkService>().callApi<UpdateProfileModel>(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.updateProfile,
        body: {'name' : name, 'image' : image},
        isFormData: true,
      ),
      mapper: (json) => UpdateProfileModel.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<String>> sendCodeToOldPhone(String phone) async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.sendCodeToOldPhone,
        body: {'phone' : phone},
      ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<String>> verifyOldPhone({required String phone, required String code}) async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.verifyOldPhone,
        body: {
          'phone' : phone,
          'code' : code,
          'country_code' : '966'
        },
      ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<String>> sendCodeToNewPhone(String phone) async{
    final result = await sl<NetworkService>().callApi<String>(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.sendCodeToNewPhone,
          body: {'phone' : phone}
        ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<UserResponse>> verifyNewPhone({required String phone, required String code}) async{
    final result = await sl<NetworkService>().callApi<UserResponse>(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.verifyNewPhone,
        body: {
          'phone' : phone,
          'code' : code,
        },
      ),
      mapper: (json) => UserResponse.fromJson(json),
    );

    return result;
  }
}