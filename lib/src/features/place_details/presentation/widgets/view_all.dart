part of '../imports/categories_imports.dart';

enum ViewAllType {products, offers}

class ViewAll extends StatelessWidget {
  final ViewAllType viewAllType;

  const ViewAll({super.key,
    required this.viewAllType,
  });

  const ViewAll.offers({super.key}) : viewAllType = ViewAllType.offers;

  const ViewAll.products({super.key}) : viewAllType = ViewAllType.products;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          viewAllType == ViewAllType.products?
          LocaleKeys.products : LocaleKeys.offers,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        const Spacer(),
        InkWell(
          onTap: viewAllType == ViewAllType.products?
              () => Go.to(BlocProvider.value(
                  value: context.read<DetailsCubit>(),
                  child: const ProductsScreen()
              )) :
              () => Go.to(BlocProvider.value(
                  value: context.read<DetailsCubit>(),
                  child: const OffersScreen()
              )),
          child: Row(
            children: [
              AppText(LocaleKeys.viewAll, color: AppColors.primaryColor,),
              Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primaryColor, size: 16.sp,)
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 22.w, vertical: 12.h);
  }
}