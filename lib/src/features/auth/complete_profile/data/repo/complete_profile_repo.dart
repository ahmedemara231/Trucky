part of '../imports/imports.dart';

abstract interface class CompleteProfileRepo{
  Future<Result<BaseModel<UserResponse>, Failure>> completeProfile(CompleteProfileRequest request);
}

class CompleteProfileRepoImpl implements CompleteProfileRepo{
  final CompleteProfileDataSource completeProfileDataSource;
  CompleteProfileRepoImpl({required this.completeProfileDataSource});

  @override
  Future<Result<BaseModel<UserResponse>, Failure>> completeProfile(CompleteProfileRequest request) async{
    return completeProfileDataSource.completeProfile(request).handleCallbackWithFailure();
  }
}