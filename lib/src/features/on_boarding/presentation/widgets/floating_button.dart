part of '../imports/imports.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key,
    required this.onTap,
    required this.decoration,
    required this.color,
  });

  final void Function() onTap;
  final BoxDecoration decoration;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: color,
            ).animate(key: UniqueKey()).rotate(duration: 300.milliseconds),
          ),
        ),
      ),
    );
  }
}