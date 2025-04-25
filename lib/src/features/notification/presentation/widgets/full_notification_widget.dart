part of '../imports/imports.dart';

class FullNotificationWidget extends StatelessWidget {

  final NotificationModel model;
  const FullNotificationWidget({super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AppText(model.title, color: AppColors.darkPrimary),
              const Spacer(),
              SvgPicture.asset(Assets.iconsRightIcon)
            ],
          ),
          AppText(model.body, color: Colors.grey),
          Row(
            children: [
              const Spacer(),
              Row(
                spacing: 5.w,
                children: [
                  Icon(Icons.watch_later_outlined, size: 16.sp, color: Colors.grey,),
                  AppText(model.createdAt, color: Colors.grey),
                ],
              ),
            ],
          )
        ],
      ).paddingAll(12.r),
    );
  }
}