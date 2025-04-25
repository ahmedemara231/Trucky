import 'package:flutter_base/src/core/shared/models/pagination.dart';
import '../../../../core/shared/models/app_categories.dart';

class CategoriesResponse{
  List<AppCategories> categories;
  AppPagination pagination;

  CategoriesResponse({
    required this.categories,
    required this.pagination,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> jsonData) => CategoriesResponse(
    categories: (jsonData['data'] as List)
        .map((e) => AppCategories.fromJson(e)).toList(),
    pagination: AppPagination.fromJson(jsonData['pagination'])
  );
}