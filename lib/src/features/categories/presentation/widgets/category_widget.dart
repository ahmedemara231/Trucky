part of '../imports/categories_imports.dart';

class CategoryWidget extends StatelessWidget {
  final AppCategories item;
  const CategoryWidget({super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Helpers.isBlocProvided<CategoriesCubit>(context)?
    _CategoriesWidgetBody(item: item) :
    BlocProvider(
      create: (context) => CategoriesCubit(
          categoriesRepo: sl<CategoriesRepo>(),
          searchRepo: sl<SearchRepo>()
      ),
      child: _CategoriesWidgetBody(item: item),
    );
  }
}

class _CategoriesWidgetBody extends StatelessWidget {
  final AppCategories item;
  const _CategoriesWidgetBody({required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Go.to(
          CategoryStackHolder(categoryId: item.id, categoryName: item.name)
      ),
      child: Container(
        padding:  EdgeInsets.all( 8.h),
        width: 100.w,
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.12),
            borderRadius: BorderRadius.circular(7.r)
        ),
        child: Column(
          spacing: 8.h,
          children: [
            Expanded(
                child: CachedImage(url: item.image)
            ),
            AppText(
              item.name,
              overflow: TextOverflow.ellipsis,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

