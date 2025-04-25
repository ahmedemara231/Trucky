part of '../imports/imports.dart';

abstract class ProfileRepo {
  Future<Result<BaseModel<UserData>, Failure>> fetchProfileData();
  Future<Result<BaseModel<UpdateProfileModel>, Failure>> updateProfile({
    String? name,
    File? image,
  });

  Future<Result<BaseModel<String>, Failure>> sendCodeToOldPhone(String phone);
  Future<Result<BaseModel<String>, Failure>> verifyOldPhone({required String phone, required String code});
  Future<Result<BaseModel<String>, Failure>> sendCodeToNewPhone(String phone);
  Future<Result<BaseModel<UserResponse>, Failure>> verifyNewPhone({required String phone, required String code});
}

class ProfileRepoImpl implements ProfileRepo {
  final ProfileDataSource remoteDataSource;

  ProfileRepoImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Result<BaseModel<UserData>, Failure>> fetchProfileData()async {
    return await remoteDataSource.fetchProfileData().handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<UpdateProfileModel>, Failure>> updateProfile({String? name, File? image})async {
    return await remoteDataSource.updateProfile(image:image, name: name)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> sendCodeToOldPhone(String phone) async{
    return await remoteDataSource.sendCodeToOldPhone(phone).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> verifyOldPhone({required String phone, required String code}) async{
    return await remoteDataSource
        .verifyOldPhone(phone: phone, code: code)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> sendCodeToNewPhone(String phone) async{
    return await remoteDataSource.sendCodeToNewPhone(phone).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<UserResponse>, Failure>> verifyNewPhone({required String phone, required String code}) async{
    return await remoteDataSource
        .verifyNewPhone(phone: phone, code: code)
        .handleCallbackWithFailure();
  }


}