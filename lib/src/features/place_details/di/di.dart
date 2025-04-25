import 'package:flutter_base/src/features/place_details/data/imports/imports.dart';

import '../../../config/res/constants_manager.dart';

void setUpDetailsDependencies() {
  sl.registerLazySingleton<DetailsRepo>(
        () => DetailsRepositoryImpl(
      dataSource: sl<DetailsDataSource>(),
    ),
  );

  sl.registerLazySingleton<DetailsDataSource>(
        () => DetailsDataSourceImpl(),
  );
}
