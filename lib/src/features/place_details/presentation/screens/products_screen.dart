part of '../imports/categories_imports.dart';

class ProductsScreen extends StatefulWidget {
  final int? providerId;
  const ProductsScreen({super.key,
    this.providerId
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  // @override
  // void initState() {
  //   context.read<DetailsCubit>().getProducts(
  //       context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
        appBar: CustomAppBar(
          title: AppText(LocaleKeys.products, fontWeight: FontWeight.bold),
        ),
        body: EasyPagination<BaseModel<ProductsResponse>, Products>.listViewRanking(
          asyncCall: (currentPage) async => await sl<DetailsDataSource>().getProductsToSpecificPlace(
            providerId: widget.providerId?? context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0,
            currentPage: currentPage,
          ),
          itemBuilder: (data, index) => Card(
              color: Colors.white,
              child: DisplayedItems.products(products: data[index]).paddingAll(12.r)
          ),
          mapper: (response) => DataListAndPaginationData<Products>(
              data: response.data.products,
              paginationData: PaginationData(totalPages: response.data.pagination.totalPages)
          ),
          loadingBuilder: CustomLoading.showLoadingView(),
        )
    );
  }

// @override
// void initState() {
//   context.read<DetailsCubit>().getProducts(
//     context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0
//   );
//   super.initState();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
//     appBar: CustomAppBar(
//       title: AppText(LocaleKeys.products, fontWeight: FontWeight.bold),
//     ),
//     body: BlocBuilder<DetailsCubit, DetailsState>(
//         builder: (context, state) => AppRefreshIndicator(
//           onRefresh: () => context.read<DetailsCubit>().getProducts(
//               context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0
//           ),
//           child: StatusBuilder(
//             status: state.baseStatus, placeHolder: '  ',
//             builder: (placeHolder, isLoading) => isLoading?
//             CustomLoading.showLoadingView() :
//             Column(
//               children: List.generate(
//                   state.products?.length?? 0,
//                       (index) => Card(
//                           color: Colors.white,
//                           child: DisplayedItems.products(products: state.products?[index]).paddingAll(12.r)
//                       )
//                   ),
//                 ).defaultAppScreenPadding()
//           ),
//         ),
//     )
//   );
// }
}

