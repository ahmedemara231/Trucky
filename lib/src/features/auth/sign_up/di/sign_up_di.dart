import 'package:flutter_base/src/features/auth/sign_up/data/imports/imports.dart';
import '../../../../config/res/constants_manager.dart';

void setUpSignUpDependencies() {
  ConstantManager.serviceLocator.registerLazySingleton<SignUpRepo>(
        () => SignUpRepoImpl(
          signUpDataSource: ConstantManager.serviceLocator<SignUpDataSource>(),
    ),
  );

  ConstantManager.serviceLocator.registerLazySingleton<SignUpDataSource>(
        () => SignUpDataSourceImpl(),
  );
}