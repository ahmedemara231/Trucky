part of '../imports/imports.dart';

abstract interface class SearchRepo{
  Future<Result<BaseModel<GetProviderModel>, Failure>> getProviders(FilterProviders filter);
  // Future<Result<BaseModel<List<City>>, Failure>> getCities(); NOT NEEDED
}

class SearchRepoImpl extends SearchRepo{
  SearchDataSource searchDataSource;
  SearchRepoImpl({required this.searchDataSource});

  @override
  Future<Result<BaseModel<GetProviderModel>, Failure>> getProviders(FilterProviders filter)async {
    return searchDataSource.getProviders(filter).handleCallbackWithFailure();
  }
}