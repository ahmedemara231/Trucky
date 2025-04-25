part of '../imports/imports.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.searchResult, fontWeight: FontWeight.bold),
      ),
      body: const _SearchResultBody(),
    );
  }
}

class _SearchResultBody extends StatelessWidget {
  const _SearchResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) => EasyPagination<BaseModel<GetProviderModel>, dynamic>.gridViewRanking(
          childAspectRatio: 1,
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          asyncCall: (currentPage) async => await sl<SearchDataSource>().getProviders(
              FilterProviders(
                  name: context.read<SearchBloc>().state.filterProviders?.name,
                  city: context.read<SearchBloc>().state.filterProviders?.city
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
    );
  }
}

// class _SearchResultBody extends StatefulWidget {
//   const _SearchResultBody({super.key});
//
//   @override
//   State<_SearchResultBody> createState() => _SearchResultBodyState();
// }
//
// class _SearchResultBodyState extends State<_SearchResultBody> {
//
//   Future<void> _search()async{
//     context.read<SearchBloc>().add(
//         ExecuteCategoriesSearch(FilterProviders(
//             name: context.read<SearchBloc>().state.filterProviders?.name,
//             city: context.read<SearchBloc>().state.filterProviders?.city
//         )));
//   }
//
//   @override
//   void initState() {
//    _search();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SearchBloc, SearchState>(
//       builder: (context, state) => AppRefreshIndicator(
//         onRefresh: () async => _search(),
//         child: StatusBuilder(
//             status: state.baseStatus,
//             placeHolder: '  ',
//             builder: (placeHolder, isLoading) => isLoading? CustomLoading.showLoadingView() :
//             state.categoriesModel!.providers.isNotEmpty?
//             ProvidersGridView(
//                 providers: state.categoriesModel?.providers ?? []
//             ) : const EmptyList()
//         ),
//       )
//     );
//   }
// }