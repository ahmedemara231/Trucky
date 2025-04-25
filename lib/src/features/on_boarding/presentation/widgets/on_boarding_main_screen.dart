part of '../imports/imports.dart';

class OnBoardingMainScreen extends StatelessWidget {
  final SingleScreenView inputs;

  const OnBoardingMainScreen({
    super.key,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 22.h,
      children: [
        UpperImage(imageUrl: inputs.upperImageUrl),
        DotsIndicator(inputs: inputs.dotsIndicatorInputs),
        LowerStack(inputs: inputs.lowerStackInputs)
      ],
    ).defaultAppScreenPadding();
  }
}
