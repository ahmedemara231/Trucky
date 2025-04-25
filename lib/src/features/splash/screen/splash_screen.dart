part of '../imports/imports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _initApp();
    super.initState();
  }


  void _initApp() async {
    NotificationNavigator(
      onRoutingMessage: (message) {
        NotificationRoutes.navigateByType(message.data);
      },
      onNoInitialMessage: () {},
    ); // TODO add notification navigator

    await ConstantManager.serviceLocator<NotificationService>()
        .setupNotifications();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height / 5,
              width: 250.w,
              child: SvgPicture.asset(
                Assets.svgAppLogo,
                height: 0.3.sh,
                width: 0.3.sw,
              ),
            ),
            const SplashAnimatedTest()
          ],
        ),
      ),
    );
  }
}