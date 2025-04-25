part of '../imports/imports.dart';

class Background extends StatelessWidget {
  final BoxDecoration decoration;
  const Background({super.key, required this.decoration});
  @override
  Widget build(BuildContext context) {
    return Container(decoration: decoration).animate().scaleXY(
        begin: 0,
        end: 6,
        duration: 1.5.seconds,
        curve: Curves.linear
    );
  }
}