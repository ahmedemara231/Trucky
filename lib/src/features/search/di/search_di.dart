import 'package:flutter_base/src/features/search/data/imports/imports.dart';

import '../../../config/res/constants_manager.dart';

void setUpSearchDependencies() {
  sl.registerLazySingleton<SearchRepo>(
        () => SearchRepoImpl(
      searchDataSource: sl<SearchDataSource>(),
    ),
  );

  sl.registerLazySingleton<SearchDataSource>(
        () => SearchDataSourceImpl(),
  );
}
