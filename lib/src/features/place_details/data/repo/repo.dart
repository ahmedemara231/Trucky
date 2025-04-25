part of '../imports/imports.dart';

abstract interface class DetailsRepo{
  Future<Result<BaseModel<ProviderDetailsModel>, Failure>> showProviderDetails(int providerId);
  Future<Result<BaseModel<CheckResponse>, Failure>> check({
    required int providerId,
    required CheckStatus checkStatus,
  });

  Future<Result<BaseModel<ProductsResponse>, Failure>> getProductsToSpecificPlace({required int providerId, required int currentPage});
  Future<Result<BaseModel<OffersResponse>, Failure>> getOffersToSpecificPlace({required int providerId, required int currentPage});
  Future<Result<BaseModel<String>, Failure>> addRate(AddRateBody body);

}


class DetailsRepositoryImpl implements DetailsRepo{
  DetailsDataSource dataSource;
  DetailsRepositoryImpl({required this.dataSource});

  @override
  Future<Result<BaseModel<ProviderDetailsModel>, Failure>> showProviderDetails(int providerId) async{
    return dataSource.showProviderDetails(providerId).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<CheckResponse>, Failure>> check({required int providerId, required CheckStatus checkStatus}) async{
    return dataSource
        .check(providerId: providerId, checkStatus: checkStatus)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<ProductsResponse>, Failure>> getProductsToSpecificPlace({required int providerId, required int currentPage}) async{
    return dataSource
        .getProductsToSpecificPlace(providerId: providerId, currentPage: currentPage)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<OffersResponse>, Failure>> getOffersToSpecificPlace({required int providerId, required int currentPage}) async{
    return dataSource
        .getOffersToSpecificPlace(providerId: providerId, currentPage: currentPage)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> addRate(AddRateBody body) async{
    return dataSource.addRate(body).handleCallbackWithFailure();
  }

}