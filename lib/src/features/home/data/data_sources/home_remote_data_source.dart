part of '../imports/data_imports.dart';

abstract class HomeRemoteDataSource {
  Future<BaseModel<HomeDataModel>> fetchHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<BaseModel<HomeDataModel>> fetchHomeData() async{
    final homeDataResult = await sl<NetworkService>().callApi<HomeDataModel>(
      NetworkRequest(
          method: RequestMethod.get,
          path: ApiConstants.home,
          queryParameters: {'order_by_distance' : 1},
        ),
      mapper: (json) => HomeDataModel.fromJson(json['data']),
    );

    return homeDataResult;
  }
}
