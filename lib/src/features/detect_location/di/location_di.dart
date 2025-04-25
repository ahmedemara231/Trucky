import 'package:flutter_base/src/features/detect_location/data/imports/imports.dart';

import '../../../config/res/constants_manager.dart';

void setUpLocationDependencies() {
  sl.registerLazySingleton<LocationRepo>(
        () => LocationRepoImpl(sl<LocationDataSource>()),
  );

  sl.registerLazySingleton<LocationDataSource>(
        () => LocationDataSourceImpl(),
  );
}