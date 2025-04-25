import 'package:flutter_base/src/features/on_boarding/data/data_source/on_boarding_data_source.dart';
import 'package:flutter_base/src/features/on_boarding/data/repo/repo.dart';

import '../../../config/res/constants_manager.dart';

void setUpOnBoardingDependencies() {
  sl.registerLazySingleton<OnBoardingRepo>(
        () => OnBoardingRepoImpl(
      sl<OnBoardingDataSource>(),
    ),
  );

  sl.registerLazySingleton<OnBoardingDataSource>(
        () => OnBoardingDataSourceImpl(),
  );
}
