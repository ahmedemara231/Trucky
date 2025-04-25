part of '../imports/imports.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => OnBoardingCubit(sl<OnBoardingRepo>()),
        child: const _OnBoardingViewBody(),
      ),
    );
  }
}

class _OnBoardingViewBody extends StatefulWidget {
  const _OnBoardingViewBody({super.key});

  @override
  State<_OnBoardingViewBody> createState() => __OnBoardingViewBodyState();
}

class __OnBoardingViewBodyState extends State<_OnBoardingViewBody> {
  int currentPage = 0;
  late WholeViewModel model;

  Future<void> manageLastIndex() async {
    Go.offAll(const SignUp());
    await CacheStorage.write(
        CacheConstants.onBoardingSubmission,
        true
    );
  }

  Future<void> navigateForwardAndAnimate({required int count}) async {
    if(currentPage == count - 1){
      manageLastIndex();
    }else{
      currentPage++;
      log(currentPage.toString());
      model.backgrounds.add(
          Background(
            decoration: model.screensBackgroundGradientColors(currentPage),
          ));
      setState(() {});
    }
  }

  void navigateBackAndAnimate() {
    switch (currentPage) {
      case 0:
        return;

      default:
        currentPage--;
        model.backgrounds.add(
            Background(
              decoration: model.screensBackgroundGradientColors(currentPage),
            ));
        setState(() {});
    }
  }

  @override
  void initState() {
    model = WholeViewModel();
    context.read<OnBoardingCubit>().getOnBoardingData();
    super.initState();
  }

  void swipeBasedCurrentLang({required DragEndDetails details, required int count}) {
    switch (Languages.currentLanguage) {
      case Languages.arabic:
        onSwipeWithArabic(details: details, count: count);
        break;

      default:
        onSwipeWithEnglish(details: details, count: count);
        break;
    }
  }

  void onSwipeWithArabic({required DragEndDetails details, required int count}) {
    if (details.primaryVelocity! > 0) { // positive
      navigateForwardAndAnimate(count: count); // Swiped Right
    } else if (details.primaryVelocity! < 0) { // negative
      navigateBackAndAnimate(); // Swiped Left
    }
  }

  void onSwipeWithEnglish({required DragEndDetails details, required int count}) {
    if (details.primaryVelocity! > 0) { // positive
      navigateBackAndAnimate(); // Swiped Left
    } else if (details.primaryVelocity! < 0) { // negative
      navigateForwardAndAnimate(count: count); // Swiped Right
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(
            onTap: () => navigateForwardAndAnimate(count: state.onBoardingResponse!.models.length),
            decoration: model.buttonBackgroundGradientColors(currentPage),
            color: model.buttonIconsColor(currentPage)
        ).paddingBottom(40),
        body: SafeArea(
          child: GestureDetector(
            onHorizontalDragEnd: (details) => swipeBasedCurrentLang(details: details, count: state.onBoardingResponse!.models.length),
            child: Stack(
              children: [
                ...model.backgrounds,
                BlocBuilder<OnBoardingCubit, OnBoardingState>(
                    builder: (context, state) => StatusBuilder(
                      status: state.baseStatus,
                      placeHolder: '  ',
                      builder: (placeHolder, isLoading) => isLoading? CustomLoading.showLoadingView() :
                      OnBoardingMainScreen(
                        inputs: model.getOnBoardingNewView(
                            count: state.onBoardingResponse!.models.length,
                            onBoardingModels: OnBoardingModel(
                              image: state.onBoardingResponse!.models[currentPage].image,
                              title: state.onBoardingResponse!.models[currentPage].title,
                              description: state.onBoardingResponse!.models[currentPage].description,
                            ),
                        )[currentPage],
                      ),
                    )
                ),
                BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  builder: (context, state) => StatusBuilder(
                      status: state.baseStatus,
                      placeHolder: '  ',
                      builder: (placeHolder, isLoading) => isLoading?
                      const CupertinoActivityIndicator() :
                      currentPage == state.onBoardingResponse!.models.length - 1?
                      const AppText('') : Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: manageLastIndex,
                              child: AppText(
                                  LocaleKeys.skip,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: model.skipTextColor(currentPage)
                              )
                          )
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}