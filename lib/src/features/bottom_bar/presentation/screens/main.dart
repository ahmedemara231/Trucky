part of '../imports/imports.dart';

class SharedData {
  SharedData._();

  static SharedData? _instance;

  static SharedData get instance {
    _instance ??= SharedData._();
    return _instance!;
  }

  ValueNotifier<int> currentScreen = ValueNotifier(Languages.currentLanguage == Languages.english ? 0 : 2);

  void changeScreen(int newScreen) => currentScreen.value = newScreen;

  late List<Widget> screens;

  void initScreens() {
    screens = const [
      HomeScreen(),
      NotificationScreen(),
      MoreScreen(),
    ];
  }

  void backToInitial(){
    currentScreen = ValueNotifier(Languages.currentLanguage == Languages.english ? 0 : 2);
  }
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => AppBottomBarState();
}

class AppBottomBarState extends State<AppBottomBar> {

  Future<void> _initDeepLinking()async{
    // await DeepLinkingHelper().init();
    BuildDynamicLink.receiveDynamicLinkForBackgroundForegroundState();
    BuildDynamicLink.receiveDynamicLinkForTerminated();
  }

  @override
  void initState() {
    _initDeepLinking();
    SharedData.instance.initScreens();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.locale;
    return BlocProvider(
      create: (context) => NotificationCubit(sl<NotificationRepo>()),
      child: Scaffold(
        backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
        bottomNavigationBar: const AppBottomBarBody(),
        body: ValueListenableBuilder<int>(
          valueListenable: SharedData.instance.currentScreen,
          builder: (context, value, child) => Languages.currentLanguage == Languages.english ?
          SharedData.instance.screens[value] :
          SharedData.instance.screens.reversed.toList()[value],
        ),
      ),
    );
  }
}

class AppBottomBarBody extends StatefulWidget {
  const AppBottomBarBody({super.key});

  @override
  State<AppBottomBarBody> createState() => _AppBottomBarBodyState();
}

class _AppBottomBarBodyState extends State<AppBottomBarBody> {
  late NotchBottomBarController notchBottomBarController;

  Future<void> getNotificationCount() async {
    await context.read<NotificationCubit>().getNotificationCount();
  }

  @override
  void initState() {
    super.initState();
    getNotificationCount();
    notchBottomBarController = NotchBottomBarController(
        index: Languages.currentLanguage == Languages.english ? 0 : 2
    );
  }

  @override
  void dispose() {
    notchBottomBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.locale;
    final notificationCount = context.watch<NotificationCubit>().state.notificationCount;
    List<BottomBarItem> bottomBarItems = [
      BottomBarItem(
        inActiveItem: const BottomBarItemWidget(icon: Assets.iconsHomeIcon, status: TabStatus.inactive),
        activeItem: const BottomBarItemWidget(icon: Assets.iconsHomeIcon, status: TabStatus.active),
        itemLabel: LocaleKeys.home,
      ),
      BottomBarItem(
        inActiveItem: badges.Badge(
          badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.secondary),
          showBadge: notificationCount != 0,
          badgeContent: Text(
            notificationCount.toString(),
            textAlign: TextAlign.center,
          ),
          position: badges.BadgePosition.custom(bottom: 5, end: 10),
          child: const BottomBarItemWidget(
            icon: Assets.iconsNotificationIcon,
            status: TabStatus.inactive,
          ),
        ),
        activeItem: badges.Badge(
          badgeStyle: const badges.BadgeStyle(badgeColor: AppColors.secondary),
          showBadge: notificationCount != 0,
          badgeContent: Text(
            notificationCount.toString(),
            textAlign: TextAlign.center,
          ),
          position: badges.BadgePosition.custom(bottom: 5, end: 10),
          child: const BottomBarItemWidget(
            icon: Assets.iconsNotificationIcon,
            status: TabStatus.active,
          ),
        ),
        itemLabel: LocaleKeys.notifications,
      ),
      BottomBarItem(
        inActiveItem: const BottomBarItemWidget(icon: Assets.iconsMoreIcon, status: TabStatus.inactive),
        activeItem: const BottomBarItemWidget(icon: Assets.iconsMoreIcon, status: TabStatus.active),
        itemLabel: LocaleKeys.more,
      ),
    ];

    return AnimatedNotchBottomBar(
        notchBottomBarController: notchBottomBarController,
        onTap: SharedData.instance.changeScreen,
        kIconSize: 19.sp,
        shadowElevation: 0,
        showShadow: false,
        itemLabelStyle: const TextStyle(color: Colors.grey),
        kBottomRadius: 16,
        showTopRadius: true,
        bottomBarItems: Languages.currentLanguage == Languages.english ?
        bottomBarItems : bottomBarItems.reversed.toList()
    );
  }
}