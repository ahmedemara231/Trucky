part of '../imports/imports.dart';

enum Place{searchResult, samePage}

class SearchBarAndFilterIcon extends StatelessWidget {
  final Place place;
  final int? categoryId;

  SearchBarAndFilterIcon({super.key,
    required this.place,
    this.categoryId
  });

  int? cityId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        spacing: 7.w,
        children: [
          Expanded(
              child: DefaultTextField(
                prefixIcon: SvgPicture.asset(Assets.iconsSearch, color: Colors.grey).paddingAll(16),
                title: LocaleKeys.searchOnProviders,
                  onChanged: (pattern) => context.read<SearchBloc>().add(
                      EnterPattern(
                        FilterProviders(
                          category: categoryId,
                          name: pattern,
                          city: cityId,
                        ),
                      )
                  )
                // onChanged: (pattern) => context.read<SearchBloc>().add(
                //     OnChange(
                //         place: place,
                //         filterProviders: FilterProviders(
                //           category: categoryId,
                //           name: pattern,
                //           city: cityId,
                //         ),
                //     )
                // )
              )
          ),
          
          InkWell(
            onTap: () async => cityId = await showFilteringSheet(context),
            child: Container(
              width: 50,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: SvgPicture.asset(Assets.iconsSearchSortIcon).paddingAll(12),
            ),
          )
        ],
      ),
    );
  }
  Future<int?> showFilteringSheet(BuildContext context)async{
    final result = await showModalBottomSheet<int>(
      context: context,
      builder: (ctx) => SizedBox(
          height: context.height / 2.3,
          child: BlocProvider.value(
              value: context.read<SearchBloc>(),
              child: _Filter(place: place, categoryId: categoryId)
          )
      ),
    );
    return result;
  }
}

class _Filter extends StatelessWidget {

  final int? categoryId;
  final Place place;
  _Filter({super.key,
    required this.place,
    required this.categoryId
  });

  int? cityId;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SheetDivider(),
          AppText(
            LocaleKeys.searchFilteration,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ).paddingSymmetric(vertical: 10.h),
          DefaultDropDownField<City>(
            itemAsString: (city) => city?.name ?? 'Error',
            asyncItems: (value) async => await _cities,
            onChanged: (newSelection) => cityId = newSelection?.id,
            prefixIcon: SvgPicture.asset(Assets.iconsLocationMarker).paddingAll(12),
            suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            hint: LocaleKeys.city,
            label: LocaleKeys.city,
          ).paddingSymmetric(vertical: 10.h),
          LoadingButton(
              title: LocaleKeys.confirm,
              onTap: () async {
                Navigator.pop(context, cityId);
                context.read<SearchBloc>().add(
                    EnterPattern(
                      FilterProviders(
                        category: categoryId,
                        name: context.read<SearchBloc>().state.filterProviders?.name,
                        city: cityId,
                      ),
                    )
                );

                // context.read<SearchBloc>().add(
                //     OnChange(
                //       place: place,
                //       filterProviders: FilterProviders(
                //         category: categoryId,
                //         name: context.read<SearchBloc>().state.filterProviders?.name,
                //         city: cityId,
                //       ),
                //     )
                // );
              }
          )
        ],
      ).paddingAll(12),
    );
  }
  Future<List<City>> get _cities async{
    final result = await sl<SearchDataSource>().getCities();
    return result.data;
  }
}