part of '../imports/imports.dart';

class ChangePhoneTexts extends StatelessWidget {
  const ChangePhoneTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 7.h,
      children: [
        AppText(LocaleKeys.newPhone, fontWeight: FontWeight.bold, fontSize: 16.sp,),
        AppText(LocaleKeys.pleaseEnterPhoneNumber)
      ],
    );
  }
}
