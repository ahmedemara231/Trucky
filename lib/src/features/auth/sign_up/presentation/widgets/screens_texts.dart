part of '../imports/imports.dart';

class LoginTexts extends StatelessWidget {
  const LoginTexts({super.key});

  @override
  Widget build(BuildContext context) {
    context.locale;
    return Column(
      children: [
        AppText(LocaleKeys.signIn, fontWeight: FontWeight.bold,),
        AppText(LocaleKeys.pleaseEnterPhoneNumber, color: AppColors.grey),
      ],
    );
  }
}
