part of '../imports/categories_imports.dart';

class PlaceSocialMedia extends StatelessWidget {
  const PlaceSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final ProviderDetailsModel? detailsState =
        context.read<DetailsCubit>().detailsState?.data;

    final iconMap = {
      "facebook": Assets.iconsFacebookIcon,
      "instagram": Assets.iconsInstagramIcon,
      "snapchat": Assets.iconsSnapshatIcon,
      "twitter": Assets.iconsTweeterIcon,
    };

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                height: 62.h,
                width: 62.w,
                child: CachedImage(url: detailsState!.image)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 3.h,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              LocaleKeys.restaurant,
                              color: AppColors.forth,
                              fontSize: 14.sp,
                            ),
                            AppText(
                              detailsState.name,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          detailsState.socials.length,
                          (index) {
                            final social = detailsState.socials[index];
                            final iconAsset =
                                iconMap[social.name] ?? Assets.iconsTweeterIcon;
                            return InkWell(
                              onTap: () =>
                                  LauncherHelper.launchURL(url: social.value),
                              child: SizedBox.square(
                                dimension: 30.r,
                                child: SvgPicture.asset(
                                  iconAsset,
                                  fit: BoxFit.fill,
                                ).paddingSymmetric(horizontal: 2.w),
                              ),
                            );
                          },
                        ),
                      ).paddingSymmetric(horizontal: 7.w),
                    ],
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        detailsState.location.length,
                        (index) => AppText(
                          detailsState.location[index].mapDesc ?? '',
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ))
                ],
              ).paddingSymmetric(horizontal: 12.w),
            ),
          ],
        ),
        const AppDivider()
      ],
    );
  }
}
