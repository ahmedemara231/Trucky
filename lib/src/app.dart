import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/config/res/constants_manager.dart';
import 'package:flutter_base/src/core/widgets/offline_widget.dart';
import 'package:flutter_base/src/features/splash/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/themes/app_theme.dart';
import 'core/helpers/loading_manager.dart';
import 'core/navigation/navigator.dart';
import 'core/shared/cubits/user_cubit/user_cubit.dart';
import 'core/shared/route_observer.dart';
import 'package:dio/dio.dart';
import 'core/widgets/app_text.dart';
import 'core/shared/base_model.dart';
import 'core/widgets/paginated_list.dart';
import 'package:flutter_base/src/core/error/exceptions.dart';

class Trucky extends StatelessWidget {
  const Trucky({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(ScreenSizes.width, ScreenSizes.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return BlocProvider(
          create: (context) => sl<UserCubit>(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ConstantManager.projectName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: Go.navigatorKey,
            home: const SplashScreen(),
            navigatorObservers: [AppNavigationObserver()],
            theme: AppTheme.light,
            builder: (context, child) {
              return OfflineWidget(
                child: FullScreenLoadingManager(child: child!),
              );
            },
          ),
        );
      },
    );
  }
}


// class PaginatedTest extends StatelessWidget {
//   const PaginatedTest({super.key});
//
//   Future<BaseModel<List<int>>> test(int currentPage)async {
//     await Future.delayed(const Duration(seconds: 2));
//     if(currentPage == 2){
//       throw ServerException('any error');
//       throw DioException(requestOptions: RequestOptions(), response: Response(requestOptions: RequestOptions(), data: {'msg' : 'errorrrrrrr'}));
//     }
//     return BaseModel(message: 'message', data: [1,1,11,1,1,1,1,1,1,1,1,1]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: EasyPagination<BaseModel<List<int>>, int>.gridViewRanking(
//         childAspectRatio: 1,
//         // errorMessageMapper: (error) => error.response?.data['msg'],
//           asyncCall: (currentPage) => test(currentPage),
//           itemBuilder: (data, index) => Center(
//               child: AppText(
//                 data[index].toString(),
//                 fontSize: 40,
//                 fontWeight: FontWeight.w500,
//               )
//           ),
//           errorBuilder: (errorMsg) => AppText(errorMsg),
//           mapper: (response) => DataListAndPaginationData<int>(
//               data: response.data,
//               paginationData: PaginationData(
//                 totalPages: 4
//               )
//           ),
//         // loadingBuilder: CustomLoading.showLoadingView(),
//       ),
//     );
//   }
// }
