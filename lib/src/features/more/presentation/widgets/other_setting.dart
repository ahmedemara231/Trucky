part of '../imports/imports.dart';

class OtherSetting extends StatelessWidget {
  OtherSetting({super.key});

  final List<MoreItemModel> models = [
    MoreItemModel(title: LocaleKeys.changeProfile, icon: Assets.iconsProfilePersonIcon),
    MoreItemModel(title: LocaleKeys.changePhone, icon: Assets.iconsPhoneIcon),
    MoreItemModel(title: LocaleKeys.deleteMyAccount, icon: Assets.iconsDeleteIcon),
  ];

  void _to(Widget screen){
    Go.to(screen);
  }

  Future<void> ensureDeletingAccount(BuildContext context)async{
    showModalBottomSheet(
        context: context,
        builder: (context) => const LogoutAndRemoveAccountBottomSheet(sheetType: SheetType.removeAccount)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 2/3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Column(
        children: List.generate(
          models.length,
              (index) => InkWell(
                onTap: () {
                  switch(index){
                    case 0:
                      _to(const ChangeProfile());

                    case 1:
                      _to(
                          SendOtpToUpdatePhone(
                            phone: UserData.fromJson(
                                  jsonDecode(CacheStorage.read('user'))
                              ).phone.toString(),
                            apiRequest: ApiRequest.toOldPhone,
                          ));
                      
                    case 2:
                      ensureDeletingAccount(context);
                  }
                },
                child: SettingItemWidget(
                    model: models[index],
                    index: index
                ),
              ),
        )
      ).paddingAll(10),
    );
  }
}