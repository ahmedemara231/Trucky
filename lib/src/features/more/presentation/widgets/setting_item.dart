part of '../imports/imports.dart';


class SettingItemWidget extends StatelessWidget {
  final MoreItemModel model;
  final int index;
  const SettingItemWidget({super.key,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        Row(
          children: [
            AppText(
              model.title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: index == 2?
              Colors.red : Colors.black87,
            ),
            const Spacer(),
            SvgPicture.asset(model.icon, color: index == 2? Colors.red : Colors.black87)
          ],
        ),
        AppDivider(color: index == 2? Colors.red : null),
      ],
    ).paddingSymmetric(vertical: 5.h);
  }
}