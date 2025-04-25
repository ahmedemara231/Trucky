part of '../imports/imports.dart';

class ChangeLangWidget extends StatelessWidget {
  const ChangeLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Helpers.showChangeLangSheet(context),
      child: Container(
        width: 120.w,
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(12.r))
        ),
        child: Row(
          spacing: 7.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.iconsLoginTranslateLogo),
            AppText(LocaleKeys.english),
          ],
        ),
      ),
    );
  }
}
