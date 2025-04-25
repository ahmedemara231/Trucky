part of '../imports/imports.dart';

abstract interface class SearchDataSource{
  Future<BaseModel<GetProviderModel>> getProviders(FilterProviders filter);
  Future<BaseModel<List<City>>> getCities();
}

class SearchDataSourceImpl implements SearchDataSource {

  @override
  Future<BaseModel<GetProviderModel>> getProviders(FilterProviders filter) async{
    final result =  await sl<NetworkService>().callApi(
      NetworkRequest(
          method: RequestMethod.get,
          path: ApiConstants.showProviderDetailsOrGetProviders,
          queryParameters: filter.toJson()
      ),
      mapper: (json) => GetProviderModel.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<List<City>>> getCities() async{
    final result = await sl<NetworkService>().callApi(
        NetworkRequest(
          method: RequestMethod.get,
          path: ApiConstants.getCities,
        ),
        mapper: (json) => (json['data'] as List)
            .map((e) => City.fromJson(e as Map<String, dynamic>))
            .toList()
    );

    return result;
  }
}