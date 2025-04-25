part of '../imports/presentaion_imports.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => StatusBuilder(
                status: state.baseStatus,
                placeHolder: ' ',
                builder: (placeHolder, isLoading) => isLoading? SizedBox(
                  height: context.height/2,
                  child: CustomLoading.showLoadingView(),
                ) : Column(
                spacing: 16.h,
                children: [
                ImageSlider(
                    height: context.height / 4,
                    images: List.generate(
                        state.homeDataModel?.sliders.length ?? 0,
                            (index) => state.homeDataModel?.sliders[index].image?? ''
                    )
                ),
                const MainSections(),
                SomeCategories(
                    items: List.generate(
                      state.homeDataModel?.categories.length?? 0,
                          (index) => AppCategories(
                              id: state.homeDataModel!.categories[index].id,
                              image: state.homeDataModel?.categories[index].image?? '',
                              name: state.homeDataModel?.categories[index].name?? ''
                      ),
                    )
                ),
                SizedBox(
                  width: context.width,
                  height: context.height/2,
                  child: CustomGoogleMaps(
                      providers: state.homeDataModel?.providers?? []
                  )
                )
              ],
            )
            )
          ).defaultAppScreenPadding(),
        );
      },
    );
  }
}
