part of '../imports/imports.dart';

class DotsIndicator extends StatelessWidget {

  final DotsIndicatorInputs inputs;

  const DotsIndicator({super.key,
    required this.inputs,
  });

  @override
  Widget build(BuildContext context) {
    log('the count is ${inputs.count}');
    return AnimatedSmoothIndicator(
      activeIndex: inputs.activeIndex,
      count: inputs.count,
      effect: ExpandingDotsEffect(
          dotHeight: 7.h,
          dotWidth: 7.w,
          dotColor: AppColors.primaryColor.withOpacity(.4),
          activeDotColor: inputs.activeDotColor
      ),
    );
  }
}