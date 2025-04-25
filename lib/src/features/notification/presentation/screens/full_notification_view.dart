part of '../imports/imports.dart';

class FullNotificationView extends StatelessWidget {

  final NotificationModel model;
  const FullNotificationView({super.key,
    required this.model,
  });

  Future<void> showDeletionBottomSheet(BuildContext context, {required String notificationId})async{
    await showModalBottomSheet(
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<NotificationCubit>(),
        child: DeleteNotificationBottomSheet.deleteSingleNotification(
            notificationId: notificationId
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        otherPhase: OtherPhase.other,
        title: AppText(model.title, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              onPressed: ()async => showDeletionBottomSheet(context, notificationId: model.id),
              icon: SvgPicture.asset(Assets.iconsDeleteNotificationIcon)
          )
        ],
      ),
      body: FullNotificationWidget(
        model: model,
      ).defaultAppScreenPadding(),
    );
  }
}
