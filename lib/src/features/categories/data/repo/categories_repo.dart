part of '../imports/imports.dart';

abstract interface class CategoriesRepo{
  Future<Result<BaseModel<CategoriesResponse>, Failure>> getAllCategories(int currentPage);
}


class CategoriesRepositoryImpl implements CategoriesRepo{
  CategoriesDataSource categoriesDataSource;
  CategoriesRepositoryImpl({required this.categoriesDataSource});

  @override
  Future<Result<BaseModel<CategoriesResponse>, Failure>> getAllCategories(int currentPage)async {
    return categoriesDataSource.getAllCategories(currentPage).handleCallbackWithFailure();
  }
}