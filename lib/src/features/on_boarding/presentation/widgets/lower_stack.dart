part of '../imports/imports.dart';

class LowerStack extends StatelessWidget {

  final LowerStackInputs inputs;

  const LowerStack({super.key,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
            height: context.height / 2.8,
            child: Image.asset(inputs.stackBackGroundImageUrl, color: inputs.stackBackGroundColor)),
        Column(
          spacing: 7.h,
          children: [
            AppText(
              ConstantManager.appName,
              color: inputs.truckyWordColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              textAlign: TextAlign.center,
              inputs.description,
              fontSize: 14.sp,
              color: inputs.secondTextColor,
            ),
          ],
        ).paddingAll(16.r)
      ],
    ).animate(key: ValueKey(inputs)).fade(duration: 250.milliseconds);
  }
}
