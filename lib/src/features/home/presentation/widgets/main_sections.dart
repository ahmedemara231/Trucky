part of '../imports/presentaion_imports.dart';

class MainSections extends StatelessWidget {
  const MainSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          LocaleKeys.mainCategories,
          color: Colors.grey,
        ),
        const Spacer(),
        InkWell(
          onTap: () => Go.to(const Categories()),
          child: Row(
            children: [
              AppText(
                LocaleKeys.viewAll,
                  color: AppColors.primaryColor
              ),
              Icon(
                Languages.currentLanguage.languageCode == 'ar'?
                Icons.keyboard_double_arrow_left_sharp : Icons.keyboard_double_arrow_right_sharp,
                color: AppColors.primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }
}