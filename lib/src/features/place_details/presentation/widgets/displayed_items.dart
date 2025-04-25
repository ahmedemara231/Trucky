
part of '../imports/categories_imports.dart';
enum DisplayedItemsEnum { products, offers }
class DisplayedItems extends StatelessWidget {
  final Products? products;
  final Offers? offers;
  final DisplayedItemsEnum displayedItemsEnum;
  const DisplayedItems({
    super.key,
    required this.products,
    required this.offers,
    required this.displayedItemsEnum,
  });
  const DisplayedItems.products({super.key, required this.products})
      : displayedItemsEnum = DisplayedItemsEnum.products,
        offers = null;
  const DisplayedItems.offers({super.key, required this.offers})
      : displayedItemsEnum = DisplayedItemsEnum.offers,
        products = null;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: 64.w,
            height: 64.h,
            child: CachedImage(
              url: displayedItemsEnum == DisplayedItemsEnum.offers
                  ? offers?.images ??
                  'https://img.freepik.com/free-photo/hand-with-red-sale-sign_23-2147960646.jpg?t=st=1742053803~exp=1742057403~hmac=71eaaf1213dcc53162e355b4f182ac028bafabef47808e637dce6d47e77bf93d&w=1380'
                  : products!.imageUrl,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(15),)
                .paddingAll(5)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.w,
                children: [
                  Expanded(
                    child: AppText(
                      displayedItemsEnum == DisplayedItemsEnum.offers
                          ? offers?.offersTranslations.title ?? ''
                          : products!.translation.name,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      maxLines: 2,
                    ),
                  ),
                  AppText(
                    displayedItemsEnum == DisplayedItemsEnum.offers
                        ? '${offers?.price} ${LocaleKeys.sR}'
                        : '${products?.price} ${LocaleKeys.sR}',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
    InkWell(
    onTap: () => Helpers.shareProductOrOffer(
    displayedItemsEnum: displayedItemsEnum,
    providerId: context.read<DetailsCubit>().state.providerDetailsModel?.data.id??0
    ),
    child: SvgPicture.asset(Assets.iconsShareIcon)),
                ],
              ),
              SizedBox(
                width: context.width * 2 / 3,
                child: AppText(
                  displayedItemsEnum == DisplayedItemsEnum.offers
                      ? offers?.offersTranslations.description ?? ''
                      : products!.translation.description,
                  color: AppColors.grey,
                  fontSize: 14.sp,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
// @override
// Widget build(BuildContext context) {
//   return ListTile(
//     leading: SizedBox(
//         width: 64.w,
//         height: 64.h,
//         child: CachedImage(
//             url: displayedItemsEnum == DisplayedItemsEnum.offers? offers?.images ??
//                 'https://img.freepik.com/free-photo/hand-with-red-sale-sign_23-2147960646.jpg?t=st=1742053803~exp=1742057403~hmac=71eaaf1213dcc53162e355b4f182ac028bafabef47808e637dce6d47e77bf93d&w=1380':
//             products!.imageUrl
//         ).paddingAll(5)
//     ),
//     title: AppText(
//       displayedItemsEnum == DisplayedItemsEnum.offers?
//       offers?.offersTranslations.title??'':
//       products!.translation.name,
//       color: AppColors.primaryColor,
//       fontWeight: FontWeight.w500,
//       fontSize: 16.sp,
//       maxLines: 2,
//     ),
//     subtitle: SizedBox(
//       width: context.width * 2/3,
//       child: AppText(
//         displayedItemsEnum == DisplayedItemsEnum.offers?
//         offers?.offersTranslations.description?? '' :
//         products!.translation.description,
//         color: AppColors.grey,
//         fontSize: 14.sp,
//         maxLines: 3,
//       ),
//     ),
//     trailing: FittedBox(
//       child: Row(
//         spacing: 5.w,
//         children: [
//           AppText(
//        displayedItemsEnum == DisplayedItemsEnum.offers?
//            '${offers?.price} ${LocaleKeys.sR}' :
//            '${products?.price} ${LocaleKeys.sR}',
//             fontSize: 16.sp,
//             fontWeight: FontWeight.bold,
//             color: AppColors.primaryColor,
//           ),
//           Visibility(
//             visible: displayedItemsEnum == DisplayedItemsEnum.products,
//             child: InkWell(
//                 onTap: () {}, // TODO linking model.link
//                 child: SvgPicture.asset(Assets.iconsShareIcon)
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}