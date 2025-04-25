part of '../imports/presentaion_imports.dart';

class ProviderMarker extends StatelessWidget {

  final Providers provider;
  const ProviderMarker({super.key,
    required this.provider
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.network(
              provider.image ?? '',
              errorBuilder: (context, error, stackTrace) =>
                  AppText(LocaleKeys.exceptionError, color: Colors.red),
              filterQuality: FilterQuality.high,
              height: 80.h,
              width: 80.w,
            ),
          ),
          // CachedImage(
          //     url: provider.image ?? '',
          //     borderRadius: BorderRadius.circular(50.r),
          //     fit: BoxFit.cover,
          //     height: 100.h,
          //     width: 100.w
          // ),
          AppText(
              provider.name?? '',
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
              color: AppColors.primaryColor
          )
        ]
    );
  }
}