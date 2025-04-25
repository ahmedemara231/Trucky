part of '../imports/categories_imports.dart';

class CategoryStackHolder extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  const CategoryStackHolder({super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText(categoryName),
      ),
      body: BlocProvider(
          create: (context) => SearchBloc(sl<SearchRepo>()),
          child: _CategoryStackHolderBody(categoryId: categoryId)
      ),
    );
  }
}

class _CategoryStackHolderBody extends StatefulWidget {
  final int categoryId;
  const _CategoryStackHolderBody({super.key,
    required this.categoryId,
  });

  @override
  State<_CategoryStackHolderBody> createState() => _CategoryStackHolderBodyState();
}

class _CategoryStackHolderBodyState extends State<_CategoryStackHolderBody> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchBarAndFilterIcon(place: Place.samePage, categoryId: widget.categoryId),
          BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) => EasyPagination<BaseModel<GetProviderModel>, dynamic>.gridViewRanking(
                key: UniqueKey(),
                shrinkWrap: true,
                childAspectRatio: 1,
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                asyncCall: (currentPage) async => await sl<SearchDataSource>().getProviders(
                    FilterProviders(
                        name: searchState.filterProviders?.name,
                        city: searchState.filterProviders?.city
                    )
                ),
                loadingBuilder: CustomLoading.showLoadingView(),
                mapper: (response) => DataListAndPaginationData<dynamic>(
                  data: response.data.providers,
                  paginationData: PaginationData(totalPages: response.data.pagination?.totalPages),
                ),
                itemBuilder: (data, index) => StackHolderWidget(
                  model: data[index],
                ),
              ).defaultAppScreenPadding()
          ),
        ],
      ).defaultAppScreenPadding(),
    );
  }
}

// class _CategoryStackHolderBody extends StatefulWidget {
//   final int categoryId;
//   const _CategoryStackHolderBody({super.key,
//     required this.categoryId,
//   });
//
//   @override
//   State<_CategoryStackHolderBody> createState() => _CategoryStackHolderBodyState();
// }
//
// class _CategoryStackHolderBodyState extends State<_CategoryStackHolderBody> {
//
//   Future<void> _search()async{
//     context.read<SearchBloc>().add(ExecuteCategoriesSearch(
//         FilterProviders(
//             category: widget.categoryId,
//             topRated: true,
//             mostNear: true,
//             city: context.read<SearchBloc>().state.filterProviders?.city,
//             name: context.read<SearchBloc>().state.filterProviders?.name
//         )));
//   }
//
//   @override
//   void initState() {
//     _search();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SearchBarAndFilterIcon(place: Place.samePage, categoryId: widget.categoryId),
//           BlocBuilder<SearchBloc, SearchState>(
//             builder: (context, searchState) => AppRefreshIndicator(
//               onRefresh: () async => _search(),
//               child: StatusBuilder(
//                 status: searchState.baseStatus, placeHolder: '  ',
//                 builder: (placeHolder, isLoading) =>
//                 isLoading? SizedBox(
//                   height: context.height / 2,
//                   child: CustomLoading.showLoadingView(),
//                 ) :
//                 searchState.categoriesModel!.providers.isNotEmpty?
//                 ProvidersGridView(
//                     providers: searchState.categoriesModel?.providers ?? []
//                 ) : const EmptyList()
//               ),
//             )
//           ),
//         ],
//       ).defaultAppScreenPadding(),
//     );
//   }
// }