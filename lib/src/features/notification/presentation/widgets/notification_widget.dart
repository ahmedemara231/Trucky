part of '../imports/imports.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String time;
  const NotificationWidget({super.key,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: ListTile(
        leading: SvgPicture.asset(Assets.iconsNotificationImage),
        title: AppText(title, color: AppColors.darkPrimary),
        subtitle: Row(
          spacing: 5.w,
          children: [
            Icon(Icons.watch_later_outlined,color: Colors.grey, size: 20.sp,),
            AppText(time, color: Colors.grey),
          ],
        ),
        trailing: Icon(
          Languages.currentLanguage.languageCode == 'ar'?
          Icons.keyboard_double_arrow_left_sharp : Icons.keyboard_double_arrow_right_sharp,
          color: AppColors.primaryColor, size: 20.sp,),
      ),
    ).paddingSymmetric(vertical: 5.h);
  }
}