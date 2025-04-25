part of '../imports/imports.dart';

class NotificationSwitch extends StatelessWidget {
  NotificationSwitch({super.key});

  late bool isEnabled;

  Future<void> _changeState(bool value) async {
    await CacheStorage.write(CacheConstants.isNotificationEnabled, value);
  }

  bool getNotifyStatusFromCache(){
    isEnabled = CacheStorage.read(CacheConstants.isNotificationEnabled) ?? true; // TODO: should be taken from notification permission
    return isEnabled;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)
              ),
              child: SvgPicture.asset(
                  Assets.iconsNotificationIcon,
                  height: 30,
                  color: Colors.white
              ).paddingAll(3),
            ).paddingAll(8),
            AppText(LocaleKeys.enableNotification, fontWeight: FontWeight.w500,
              color: Colors.white,),
            const Spacer(),
            BlocBuilder<MoreCubit, MoreState>(
              builder: (context, state) =>
              state.baseStatus == BaseStatus.loading?
              const CupertinoActivityIndicator(color: Colors.white).paddingSymmetric(horizontal: 12.w) :
              Switch(
                value: getNotifyStatusFromCache(),
                activeColor: AppColors.forth,
                onChanged: (value) async {
                  _changeState(value); // false
                  await context.read<MoreCubit>().changeNotify();
                },
              ),
            ),
          ],
        ).paddingAll(3)
    );
  }
}