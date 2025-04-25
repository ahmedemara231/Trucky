part of '../imports/imports.dart';

class ConfirmLocation extends StatelessWidget {
  final String location;
  final Future<void> Function() onConfirmLocation;
  const ConfirmLocation({super.key,
    required this.location,
    required this.onConfirmLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              SvgPicture.asset(Assets.iconsLocationPlanet),
              Expanded(child: AppText(location, color: Colors.black87))
            ],
          ),
          LoadingButton(title: LocaleKeys.confirmLocation, onTap: onConfirmLocation)
        ],
      ).paddingAll(10),
    );
  }
}