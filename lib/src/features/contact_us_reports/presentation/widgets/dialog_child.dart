part of '../imports/imports.dart';

class DialogChild extends StatelessWidget {
  const DialogChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 2,
      child: Column(
        spacing: 10.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.svgSendSuccess),
          AppText(
              LocaleKeys.sentSuccessfully,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: AppColors.primaryColor
          ),
          AppText(
              LocaleKeys.wishGoodTimeForYou,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColors.secondary
          ),
        ],
      ),
    );
  }
}