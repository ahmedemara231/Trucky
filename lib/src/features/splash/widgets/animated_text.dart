part of '../imports/imports.dart';
class SplashAnimatedTest extends StatelessWidget {
  const SplashAnimatedTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(sl<ProfileRepo>()),
      child: const SplashAnimatedText(),
    );
  }
}

class SplashAnimatedText extends StatelessWidget {
  const SplashAnimatedText({super.key});
  Future<void> _manageNavigation(BuildContext context)async {
    final userCubit = context.read<UserCubit>();
    final onBoardingSubmission = await _checkOnBoardingSubmission();
    switch(onBoardingSubmission){
      case true:
        final tokenExists = await userCubit.checkTokenExistOrNot();
        switch(tokenExists){
          case true:
            await userCubit.init();
            Go.offAll(const AppBottomBar());

          default:
            Go.offAll(const SignUp());
        }

      default:
        Go.offAll(const OnBoardingView());
    }
  }

  Future<bool> _checkOnBoardingSubmission() async {
    final bool result =  CacheStorage.read(CacheConstants.onBoardingSubmission)??false;
    return result;
  }

  Future<void> onAnimationComplete(AnimationController controller, BuildContext context)async{
    await Future.delayed(const Duration(seconds: 1));
    if(context.mounted){
      await _manageNavigation(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Image.asset(Assets.imagesAppNameInSplash)
          .animate(onComplete: (controller)async => await onAnimationComplete(controller, context))
          .fade(duration: 1.seconds)
          .move(
        duration: .5.seconds,
        begin: const Offset(0, 25),
        end: const Offset(0, -0.5),
        curve: Curves.linear,
      )..onComplete,
    );
  }
}