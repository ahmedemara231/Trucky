part of '../imports/categories_imports.dart';

class PlaceDetails extends StatelessWidget {
  final int providerId;

  const PlaceDetails({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsCubit(sl<DetailsRepo>())..showProviderDetails(providerId),
      child: BlocSelector<DetailsCubit, DetailsState,
          BaseStatusWithData<ProviderDetailsModel>?>(
        selector: (state) => state.providerDetailsModel,
        builder: (context, state) => Scaffold(
          backgroundColor:
              Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
          appBar: CustomAppBar(
            title: AppText(state?.data.name ?? '', fontWeight: FontWeight.bold),
          ),
          body: _PlaceDetailsBody(providerId: providerId),
          bottomNavigationBar:
              Container(color: Colors.white, child: const BottomButtons()),
        ),
      ),
    );
  }
}

class _PlaceDetailsBody extends StatelessWidget {
  final int providerId;

  const _PlaceDetailsBody({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: () =>
          context.read<DetailsCubit>().showProviderDetails(providerId),
      child: SingleChildScrollView(
          child: StatusBuilder(
        status: context.watch<DetailsCubit>().detailsState!.baseStatus,
        placeHolder: '  ',
        builder: (placeHolder, isLoading) => isLoading
            ? SizedBox(
                height: context.height / 2,
                child: CustomLoading.showLoadingView(),
              )
            : Column(
                spacing: 10.h,
                children: [
                  SizedBox(
                      width: context.width,
                      height: context.height / 4,
                      child: CachedImage(
                          url: context
                              .read<DetailsCubit>()
                              .detailsState!
                              .data
                              .image,
                          fit: BoxFit.fill)),
                  const RateNumbersDescriptionAndButtons(),
                  if (context
                      .read<DetailsCubit>()
                      .detailsState!
                      .data
                      .products
                      .isNotEmpty)
                    DisplayedItemsList.products(
                      products: context
                              .read<DetailsCubit>()
                              .detailsState
                              ?.data
                              .products ??
                          [],
                    ),
                  if (context
                      .read<DetailsCubit>()
                      .detailsState!
                      .data
                      .offers
                      .isNotEmpty)
                    DisplayedItemsList.offers(
                        offers: context
                                .read<DetailsCubit>()
                                .detailsState
                                ?.data
                                .offers ??
                            [])
                ],
              ).defaultAppScreenPadding(),
      )),
    );
  }
}
