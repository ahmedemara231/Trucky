part of '../imports/imports.dart';

abstract interface class CategoriesDataSource{
  Future<BaseModel<CategoriesResponse>> getAllCategories(int currentPage);
}


class CategoriesDataSourceImpl implements CategoriesDataSource{
  @override
  Future<BaseModel<CategoriesResponse>> getAllCategories(int currentPage) async{
    final result =  await sl<NetworkService>().callApi<CategoriesResponse>(
      NetworkRequest(
        method: RequestMethod.get,
        path: ApiConstants.getAllCategories,
        queryParameters: {
          'page' : currentPage
        }
      ),
      mapper: (json) => CategoriesResponse.fromJson(json['data'])
    );

    return result;
  }
}