part of '../imports/categories_imports.dart';

class OffersScreen extends StatefulWidget {
  final int? providerId;
  const OffersScreen({super.key,
    this.providerId
  });

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {

  // @override
  // void initState() {
  //   context.read<DetailsCubit>().getOffers(
  //       context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
        appBar: CustomAppBar(
          title: AppText(LocaleKeys.offers, fontWeight: FontWeight.bold),
        ),
        body: EasyPagination<BaseModel<OffersResponse>, Offers>.listViewRanking(
          asyncCall: (currentPage) async => await sl<DetailsDataSource>().getOffersToSpecificPlace(
            providerId: widget.providerId?? context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0,
            currentPage: currentPage,
          ),
          itemBuilder: (data, index) => Card(
              color: Colors.white,
              child: DisplayedItems.offers(offers: data[index]).paddingAll(12.r)
          ),
          mapper: (response) => DataListAndPaginationData<Offers>(
              data: response.data.offers,
              paginationData: PaginationData(totalPages: response.data.pagination.totalPages)
          ),
          loadingBuilder: CustomLoading.showLoadingView(),
        )
    );
  }
}
