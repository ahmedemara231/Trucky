import 'package:flutter_base/src/features/auth/send_otp/data/imports/data_imports.dart';

import '../../../../config/res/constants_manager.dart';

void setUpOtpCodeDependencies() {
  ConstantManager.serviceLocator.registerLazySingleton<OtpRepo>(
        () => OtpRepositoryImpl(
      otpDataSource: ConstantManager.serviceLocator<OtpDataSource>(),
    ),
  );

  ConstantManager.serviceLocator.registerLazySingleton<OtpDataSource>(
        () => OtpDataSourceImpl(),
  );
}
