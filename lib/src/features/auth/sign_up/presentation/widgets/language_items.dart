part of '../imports/imports.dart';

enum ChangeLangType{withApiRequest, withoutApiRequest}

class LanguageItems extends StatefulWidget {
  final ChangeLangType changeLangType;
  const LanguageItems({super.key,
    this.changeLangType = ChangeLangType.withoutApiRequest,
  });

  @override
  State<LanguageItems> createState() => _LanguageItemsState();
}

class _LanguageItemsState extends State<LanguageItems> {
  late Languages currentLanguage;

  void getCurrentLang() => currentLanguage = Languages.currentLanguage;

  String get getLangCode => currentLanguage.languageCode;

  void changeLang(BuildContext context, {required Languages newLang}) {
    setState(() => currentLanguage = newLang);
  }

  bool isLoading = false;

  void prepareWidget(){
    setState(() => isLoading = true);
    getCurrentLang();
    setState(() => isLoading = false);
  }

  @override
  void didChangeDependencies() {
    getCurrentLang();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?
    const CircularProgressIndicator() : IntrinsicHeight(
      child: Column(
        spacing: 16.h,
        children: [
          Image.asset(Assets.imagesDivider),
          InkWell(
            onTap: () => changeLang(context, newLang: Languages.arabic),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.svgArabic),
                title: AppText('اللغة العربية', fontSize: 16.sp,),
                trailing: Visibility(
                  visible: currentLanguage == Languages.arabic,
                  child: CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.done, color: Colors.white, size: 16.sp,),
                  ).animate().fadeIn(),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => changeLang(context, newLang: Languages.english),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: ListTile(
                leading: SvgPicture.asset(Assets.svgEnglish),
                title: AppText('English', fontSize: 16.sp,),
                trailing: Visibility(
                  visible: !(currentLanguage == Languages.arabic),
                  child: CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.done, color: Colors.white, size: 16.sp,),
                  ).animate().fadeIn(),
                ),
              ),
            ),
          ),
          LoadingButton(
            title: LocaleKeys.confirm,
            onTap: ()async {
              if(widget.changeLangType == ChangeLangType.withApiRequest){
                await context.read<MoreCubit>().changeLang(Languages.currentLanguage); // provide more cubit if in more screen
              }
              await Languages.setLocale(currentLanguage);
              Navigator.pop(context);
            },
            borderRadius: 40,
          )
        ],
      ).defaultAppScreenPadding(),
    );
  }
}