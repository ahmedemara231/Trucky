part of '../imports/imports.dart';

abstract interface class CompleteProfileDataSource{
  Future<BaseModel<UserResponse>> completeProfile(CompleteProfileRequest request);
}

class CompleteProfileImpl implements CompleteProfileDataSource{
  @override
  Future<BaseModel<UserResponse>> completeProfile(CompleteProfileRequest request) async{
    final result = await sl<NetworkService>().callApi<UserResponse>(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.completeProfile,
          body: request.body?.toJson(),
          headers: request.headers?.toJson(),
          isFormData: true,
        ),
      mapper: (json) => UserResponse.fromJson(json),
    );

    return result;
  }
}