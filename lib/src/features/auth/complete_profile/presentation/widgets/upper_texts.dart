part of '../imports/imports.dart';

class UpperTexts extends StatelessWidget {
  const UpperTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          LocaleKeys.welcome,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
          fontSize: 16.sp,
        ),
        AppText(
          LocaleKeys.pleaseFillTheFollowingData,
          color: AppColors.grey,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
