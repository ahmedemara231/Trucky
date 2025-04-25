import 'package:flutter_base/src/features/auth/complete_profile/data/imports/imports.dart';
import '../../../../config/res/constants_manager.dart';

void setUpCompleteProfileDependencies() {
  ConstantManager.serviceLocator.registerLazySingleton<CompleteProfileRepo>(
        () => CompleteProfileRepoImpl(
      completeProfileDataSource: ConstantManager.serviceLocator<CompleteProfileDataSource>(),
    ),
  );

  ConstantManager.serviceLocator.registerLazySingleton<CompleteProfileDataSource>(
        () => CompleteProfileImpl(),
  );
}