part of '../imports/imports.dart';

enum TabStatus {active, inactive}
class BottomBarItemWidget extends StatelessWidget {
  final String icon;
  final TabStatus status;
  const BottomBarItemWidget({super.key,
    required this.icon,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: 70,
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.fill,
          color: status == TabStatus.active?
          AppColors.primaryColor : Colors.grey,
        )
    );
  }
}