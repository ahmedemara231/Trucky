part of '../imports/data_imports.dart';

abstract class HomeRepository {
  Future<Result<BaseModel<HomeDataModel>, Failure>> fetchHomeData();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Result<BaseModel<HomeDataModel>, Failure>> fetchHomeData()async {
    return await remoteDataSource.fetchHomeData().handleCallbackWithFailure();
  }
}