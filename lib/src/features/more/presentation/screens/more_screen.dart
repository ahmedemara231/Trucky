part of '../imports/imports.dart';

class MoreScreen extends StatefulWidget {

  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {

  @override
  Widget build(BuildContext context) {
    context.locale;
    final List<MoreItemModel> models = [
      MoreItemModel(title: LocaleKeys.profile, icon: Assets.iconsProfilePersonIcon),
      MoreItemModel(title: LocaleKeys.whoUs, icon: Assets.iconsQuestionMarkIcon),
      MoreItemModel(title: LocaleKeys.conditionsAndTerms, icon: Assets.iconsPrivacyPolicyIcon),
      MoreItemModel(title: LocaleKeys.commonQuestions, icon: Assets.iconsCommonQuestionsIcon),
      MoreItemModel(title: LocaleKeys.howTruckyWork, icon: Assets.iconsProfilePersonIcon),
      MoreItemModel(title: LocaleKeys.contactUs, icon: Assets.iconsPhoneIcon),
      MoreItemModel(title: LocaleKeys.reports, icon: Assets.iconsReportsIcon),
      MoreItemModel(title: LocaleKeys.language, icon: Assets.iconsLangIcon),
      MoreItemModel(title: LocaleKeys.setting, icon: Assets.iconsSettingIcon),
    ];

    context.locale;
    return Scaffold(
      appBar: CustomAppBar(
        otherPhase: OtherPhase.main,
        title: AppText(LocaleKeys.more, fontWeight: FontWeight.bold,),
      ),
      body: BlocProvider(
        create: (context) => MoreCubit(sl<MoreRepository>()),
        child: ListView(
          children: List.generate(
            models.length,
                (index) => index == models.length -1 ? Column(
                  children: [
                    MoreItemWidget(model: models[index], index: index),
                    const LogoutButton()
                  ],
                ) : MoreItemWidget(model: models[index], index: index),
          )
        ).defaultAppScreenPadding(),
      ),
    );
  }
}