part of '../imports/imports.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.setting, fontWeight: FontWeight.bold),
      ),
      body: Column(
        spacing: 10.h,
        children: [
          NotificationSwitch(),
          OtherSetting(),
        ],
      ).defaultAppScreenPadding(),
    );
  }
}