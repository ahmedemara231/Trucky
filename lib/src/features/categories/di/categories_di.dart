import 'package:flutter_base/src/features/categories/data/imports/imports.dart';
import '../../../config/res/constants_manager.dart';

void setUpCategoriesDependencies() {
  sl.registerLazySingleton<CategoriesRepo>(
        () => CategoriesRepositoryImpl(
          categoriesDataSource:  sl<CategoriesDataSource>(),
    ),
  );


  sl.registerLazySingleton<CategoriesDataSource>(
        () => CategoriesDataSourceImpl(),
  );
}