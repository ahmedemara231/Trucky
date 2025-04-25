part of '../imports/imports.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NotificationScreen();
  }
}

class _NotificationScreen extends StatefulWidget{
  const _NotificationScreen({super.key});

  @override
  State<_NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<_NotificationScreen> {
  Future<void> showDeletionBottomSheet(BuildContext context)async{
    final result = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => BlocProvider.value(
        value: context.read<NotificationCubit>(),
        child: const DeleteNotificationBottomSheet.deleteAll(),
      ),
    );
    if(result == 'deletedAll'){
      deleteNotificationsLocally();
    }
  }

  void deleteNotificationsLocally(){
    setState(() => controller.clear());
  }

  int notificationCount = 0;
  Future<BaseModel<NotificationResponse>> _getNotifications(int currentPage)async{
    if(currentPage == 1){
      context.read<NotificationCubit>().resetNotificationCount();
    }
    return await NotificationDataSourceImpl().getNotifications(currentPage);
  }

  EasyPaginationController<NotificationModel> controller = EasyPaginationController<NotificationModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        otherPhase: OtherPhase.main,
        title: AppText(LocaleKeys.notifications, fontWeight: FontWeight.bold),
        actions: notificationCount > 0? [
          IconButton(
              onPressed: () => showDeletionBottomSheet(context),
              icon: SvgPicture.asset(Assets.iconsDeleteNotificationIcon)
          )
        ] : null,
      ),
      body: EasyPagination<BaseModel<NotificationResponse>, NotificationModel>.listViewRanking(
        controller: controller,
        asyncCall: (currentPage) async => await _getNotifications(currentPage),
        loadingBuilder: CustomLoading.showLoadingView(),
        itemBuilder: (data, index) => InkWell(
          onTap: () async{
            final value = await Go.to(BlocProvider.value(
                value: context.read<NotificationCubit>(),
                child: FullNotificationView(model: data[index])
            ));
            if(value == 'deleted'){
              setState(() => controller.removeItem(data[index]));
            }
          },
          child: NotificationWidget(
              title: data[index].title,
              time: data[index].createdAt
          ),
        ),
        mapper: (response) {
          setState(() => notificationCount = response.data.notifications.length);
          return DataListAndPaginationData<NotificationModel>(
              data: response.data.notifications,
              paginationData: PaginationData(totalPages: response.data.pagination.totalPages)
          );
        }
      ).defaultAppScreenPadding(),
    );
  }
}