part of '../imports/imports.dart';

abstract interface class DetailsDataSource{
  Future<BaseModel<ProviderDetailsModel>> showProviderDetails(int providerId);
  Future<BaseModel<CheckResponse>> check({
    required int providerId,
    required CheckStatus checkStatus,
  });

  Future<BaseModel<ProductsResponse>> getProductsToSpecificPlace({required int providerId, required int currentPage});
  Future<BaseModel<OffersResponse>> getOffersToSpecificPlace({required int providerId, required int currentPage});
  Future<BaseModel<String>> addRate(AddRateBody body);
}


class DetailsDataSourceImpl implements DetailsDataSource{
  @override
  Future<BaseModel<ProviderDetailsModel>> showProviderDetails(int providerId) async{
    final result =  await sl<NetworkService>().callApi(
      NetworkRequest(
            method: RequestMethod.get,
            path: '${ApiConstants.showProviderDetailsOrGetProviders}/$providerId'
        ),
      mapper: (json) => ProviderDetailsModel.fromJson(json['data']),
    );

    return result;
  }

  @override
  Future<BaseModel<CheckResponse>> check({
    required int providerId,
    required CheckStatus checkStatus,
}) async{
    final result = await sl<NetworkService>().callApi<CheckResponse>(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.check,
          body: {'provider_id' : providerId, 'status': checkStatus.name},
        ),
      mapper: (json) => CheckResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<ProductsResponse>> getProductsToSpecificPlace({required int providerId, required int currentPage}) async{
    final result =  await sl<NetworkService>().callApi<ProductsResponse>(
      NetworkRequest(
        method: RequestMethod.get,
        path: '${ApiConstants.showProviderDetailsOrGetProviders}/$providerId${ApiConstants.products}'
      ),

      mapper: (json) => ProductsResponse.fromJson(json['data'])
    );

    return result;
  }

  @override
  Future<BaseModel<OffersResponse>> getOffersToSpecificPlace({required int providerId, required int currentPage}) async{
    final result =  await sl<NetworkService>().callApi<OffersResponse>(
      NetworkRequest(
          method: RequestMethod.get,
          path: '${ApiConstants.showProviderDetailsOrGetProviders}/$providerId${ApiConstants.offers}'
      ),

      mapper: (json) => OffersResponse.fromJson(json['data'])
    );

    return result;
  }

  @override
  Future<BaseModel<String>> addRate(AddRateBody body)async {
    final result = await sl<NetworkService>().callApi<String>(
        NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.addRate,
          body: body.toJson()
        ),
      mapper: (json) => json['msg'],
    );

    return result;
  }
}

enum CheckStatus{check_in, check_out}