import 'package:flutter_base/src/features/profile/data/imports/imports.dart';

import '../../../config/res/constants_manager.dart';

void setUpProfileDependencies() {
  sl.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(
      remoteDataSource: sl<ProfileDataSource>(),
    ),
  );

  sl.registerLazySingleton<ProfileDataSource>(
        () => ProfileDataSourceImpl(),
  );
}
