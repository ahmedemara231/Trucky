import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import '../../config/res/color_manager.dart';
// import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:flutter/material.dart';

class AppRefreshIndicator extends StatelessWidget {

  final Future<void> Function() onRefresh;
  final Widget child;
   const AppRefreshIndicator({super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
        backgroundColor: AppColors.primaryColor,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Colors.white,
        onRefresh: onRefresh,
        child: child
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   return SmartRefresher(
  //       controller: RefreshController(),
  //       enablePullDown: true,
  //       onRefresh: onRefresh,
  //       child: child
  //   );
  // }

}
