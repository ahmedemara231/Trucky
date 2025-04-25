part of '../imports/imports.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(sl<SearchRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppText(LocaleKeys.search, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        body: const _SearchScreenBody(),
        bottomNavigationBar: const _SearchButtonAsBottomBar()
      ),
    );
  }
}

class _SearchScreenBody extends StatelessWidget {
  const _SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarAndFilterIcon(place: Place.searchResult, categoryId: null)
      ],
    ).defaultAppScreenPadding();
  }
}

class _SearchButtonAsBottomBar extends StatelessWidget {
  const _SearchButtonAsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.all(style: BorderStyle.none),
      elevation: 5,
      child: DefaultButton(
        height: 50.h,
        borderRadius: BorderRadius.circular(40.r),
        title: LocaleKeys.search,
        onTap: context.watch<SearchBloc>().state.filterProviders!.name!.isEmpty &&
            context.watch<SearchBloc>().state.filterProviders?.city == null?
        null : () async => Go.to(
            BlocProvider.value(
                value: context.read<SearchBloc>(),
                child: const SearchResult()
            )
        ),
      ).paddingSymmetric(horizontal: 50.w, vertical: 5.h),
    );
  }
}