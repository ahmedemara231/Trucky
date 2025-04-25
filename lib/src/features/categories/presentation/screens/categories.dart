part of '../imports/categories_imports.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(
          categoriesRepo: sl<CategoriesRepo>(),
          searchRepo: sl<SearchRepo>()
      ),
      child: Scaffold(
        backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
        appBar: CustomAppBar(
          title: AppText(LocaleKeys.categories),
          actions: const [
            SearchIcon() // Go to search screen
          ],
        ),
        body: const _CategoriesBody()
      ),
    );
  }
}

class _CategoriesBody extends StatelessWidget {
  const _CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyPagination<BaseModel<CategoriesResponse>, AppCategories>.gridViewRanking(
        crossAxisCount: 4,
        mainAxisSpacing: 16.h,
        childAspectRatio: .75,
        crossAxisSpacing: 10.w,
        loadingBuilder: CustomLoading.showLoadingView(),
        asyncCall: (currentPage) async => await sl<CategoriesDataSource>().getAllCategories(currentPage),
        mapper: (response) => DataListAndPaginationData<AppCategories>(
          data: response.data.categories,
          paginationData: PaginationData(totalPages: response.data.pagination.currentPage)
        ),
        itemBuilder: (data, index) => CategoryWidget(
            item: data[index]
        ),
    ).defaultAppScreenPadding();
  }
}

// class _CategoriesBody extends StatelessWidget {
//   const _CategoriesBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategoriesCubit, CategoriesState>(
//       builder: (context, state) => AppRefreshIndicator(
//         onRefresh: () => context.read<CategoriesCubit>().getAllCategories(),
//         child: StatusBuilder<AppCategories>(
//           status: state.baseStatus,
//           placeHolder: AppCategories(name: '', image: '', id: 0),
//           builder: (placeHolder, isLoading) => isLoading?
//           CustomLoading.showLoadingView() : GridView.builder(
//             itemCount: state.appCategories!.length,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               mainAxisSpacing: 16.h,
//               childAspectRatio: .75,
//               crossAxisSpacing: 10.w,
//             ),
//             itemBuilder: (context, index) => CategoryWidget(
//                 item: state.appCategories![index]
//             ),
//           ),
//         ).defaultAppScreenPadding(),
//       ),
//     );
//   }
// }