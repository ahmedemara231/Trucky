import 'package:flutter_base/src/core/network/dio_service.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/notification/notification_service.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';

import '../../../config/res/constants_manager.dart';
import '../../../features/auth/complete_profile/di/complete_profile_di.dart';
import '../../../features/auth/send_otp/di/otp_di.dart';
import '../../../features/auth/sign_up/di/sign_up_di.dart';
import '../../../features/categories/di/categories_di.dart';
import '../../../features/contact_us_reports/di/contact_us_di.dart';
import '../../../features/detect_location/di/location_di.dart';
import '../../../features/home/di/home_di.dart';
import '../../../features/more/di/more_di.dart';
import '../../../features/notification/di/di.dart';
import '../../../features/on_boarding/di/di.dart';
import '../../../features/place_details/di/di.dart';
import '../../../features/profile/di/profile_di.dart';
import '../../../features/search/di/search_di.dart';

void setUpServiceLocator() {
  setUpOnBoardingDependencies();
  setUpHomeDependencies();
  setUpGeneralDependencies();
  setUpMoreDi();
  setUpSignUpDependencies();
  setUpOtpCodeDependencies();
  setUpCompleteProfileDependencies();
  setUpLocationDependencies();
  setUpCategoriesDependencies();
  setUpProfileDependencies();
  setUpContactReportsDependencies();
  setUpSearchDependencies();
  setUpDetailsDependencies();
  setUpNotificationDependencies();
}

void setUpGeneralDependencies() {
  sl.registerLazySingleton<NetworkService>(
    () => DioService(),
  );

  sl.registerLazySingleton<UserCubit>(
    () => UserCubit(),
  );

  sl.registerFactory<NotificationService>(
    () => NotificationService(),
  );
}
