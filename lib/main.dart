import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/core/navigation/go.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/src/core/network/backend_configuation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'src/app.dart';
import 'src/core/navigation/Constants/imports_constants.dart';
import 'src/core/navigation/page_router/implementation/imports_page_router.dart';
import 'src/core/navigation/page_router/imports_page_router_builder.dart';
import 'src/core/helpers/cache_service.dart';
import 'src/core/shared/functions/setup_service_locators.dart';
import 'src/core/shared/bloc_observer.dart';
import 'src/core/widgets/exeption_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  await Future.wait(
    [
      EasyLocalization.ensureInitialized(),
      CacheStorage.init(),
      ScreenUtil.ensureScreenSize()
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  setUpServiceLocator();
  BackendConfiguation.setBackendType(BackendType.php);
  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),
    ),
  );
  if (kReleaseMode) {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => const ExceptionView();
  }
  runApp(
    EasyLocalization(
      supportedLocales: Languages.suppoerLocales,
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      saveLocale: true,
      fallbackLocale: const Locale('ar'),
      child: const Trucky(),
    ),
  );
}