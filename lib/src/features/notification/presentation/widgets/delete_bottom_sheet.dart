part of '../imports/imports.dart';

enum DeletionType {singleNotification, allNotifications}
class DeleteNotificationBottomSheet extends StatefulWidget {
  final DeletionType deletionType;
  final String? notificationId;

  const DeleteNotificationBottomSheet({super.key,
    required this.deletionType,
    required this.notificationId,
  });

  const DeleteNotificationBottomSheet.deleteSingleNotification({super.key,
    required this.notificationId,
  }) : deletionType = DeletionType.singleNotification;

  @override
  const DeleteNotificationBottomSheet.deleteAll({super.key,
  }) : deletionType = DeletionType.allNotifications, notificationId = null;

  @override
  State<DeleteNotificationBottomSheet> createState() => _DeleteNotificationBottomSheetState();
}

class _DeleteNotificationBottomSheetState extends State<DeleteNotificationBottomSheet> {
  Future<void> _deleteSingleNotification(BuildContext context, {required String notificationId})async{
    await context.read<NotificationCubit>().deleteSingleNotification(notificationId);
  }

  Future<void> _deleteAllNotifications(BuildContext context)async{
    await context.read<NotificationCubit>().deleteAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))
        ),
        child: Column(
          spacing: 10.h,
          children: [
            AppText(
              widget.deletionType == DeletionType.singleNotification?
              LocaleKeys.doYouWantToDeleteThisNotification : LocaleKeys.doYouWantToDeleteAllNotifications,
              color: Colors.red,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            const Divider(thickness: 1).paddingSymmetric(vertical: 10.h, horizontal: 15.w),
            SvgPicture.asset(Assets.svgAppLogo),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: context.width,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        border: Border.all(color: AppColors.primaryColor, width: 1)
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Center(
                        child: AppText(
                            LocaleKeys.cancel,
                            color: AppColors.primaryColor
                        ),
                      ),
                    ),
                  ).paddingSymmetric(
                    horizontal: AppMargin.mW10,
                    vertical: AppMargin.mH10,
                  ),
                ),
                BlocListener<NotificationCubit, NotificationState>(
                  listener: (context, state) => Helpers.manageBlocConsumer(
                    state.baseStatus,
                    msg: state.msg,
                    actionWhenSuccess: () => widget.deletionType == DeletionType.singleNotification? 2.popUntil(data: 'deleted') : Go.back('deletedAll'),
                  ),
                  child: Expanded(
                    child: LoadingButton(
                      title: LocaleKeys.confirm,
                      onTap: () async => widget.deletionType == DeletionType.singleNotification ?
                      await _deleteSingleNotification(context, notificationId: widget.notificationId!) :
                      _deleteAllNotifications(context),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ).paddingSymmetric(vertical: 12.h),
    );
  }
}