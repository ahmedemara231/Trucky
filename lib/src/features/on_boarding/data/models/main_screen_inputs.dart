import 'package:flutter/material.dart';
import 'package:flutter_base/src/features/on_boarding/data/models/response.dart';
import '../../../../../generated/assets.dart';
import '../../../../config/res/color_manager.dart';
import '../../presentation/imports/imports.dart';

class WholeViewModel{

  Color skipTextColor(int currentPage){
    return currentPage.isEven? Colors.white : AppColors.primaryColor;
  }

  final List<Widget> backgrounds = [
    const Background(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topLeft,
            colors: [AppColors.secondary, AppColors.primaryColor],
          ),
        ))
  ];

  BoxDecoration screensBackgroundGradientColors(int currentPage){
    return currentPage.isEven? const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
        colors: [AppColors.secondary, AppColors.primaryColor],
      ),
    ) : const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
        colors: [AppColors.greyWhite, AppColors.greyWhite],
      ),
    );
  }

  List<SingleScreenView> getOnBoardingNewView({required OnBoardingModel onBoardingModels, required int count}){
    List<SingleScreenView> inputs = [];
    for(int i = 0; i < count; i++){
      inputs.add(SingleScreenView(
          upperImageUrl: onBoardingModels.image,
          dotsIndicatorInputs:
          DotsIndicatorInputs(activeIndex: i, activeDotColor: i.isEven? Colors.white : AppColors.primaryColor, count: count),
          lowerStackInputs: LowerStackInputs(
              truckyWordColor: i.isEven? Colors.white : AppColors.primaryColor,
              secondTextColor: i.isEven? Colors.white : AppColors.primaryColor,
              stackBackGroundColor: i.isEven? AppColors.third : Colors.white,
              description: onBoardingModels.description,
              stackBackGroundImageUrl: i.isEven? Assets.imagesOnBoardingAppColorBackground : Assets.imagesOnBoardingWhiteBackground
          )
      ));
    }
    return inputs;
  }


  Color buttonIconsColor(int currentPage){
    return currentPage.isEven? AppColors.primaryColor : Colors.white;
  }

  BoxDecoration buttonBackgroundGradientColors(int currentPage){
    return currentPage.isEven? const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topLeft,
      colors: [AppColors.greyWhite, AppColors.greyWhite],
    )) : const BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
        colors: [AppColors.secondary, AppColors.primaryColor],
      ),
    );
  }
}

class SingleScreenView{
  final String upperImageUrl;
  final DotsIndicatorInputs dotsIndicatorInputs;
  final LowerStackInputs lowerStackInputs;
  final bool isSecondScreen;

  const SingleScreenView({
    required this.upperImageUrl,
    required this.dotsIndicatorInputs,
    required this.lowerStackInputs,
    this.isSecondScreen = false
  });
}

class DotsIndicatorInputs{
  final int count;
  final int activeIndex;
  final Color activeDotColor;

  const DotsIndicatorInputs({
    required this.count,
    required this.activeIndex,
    required this.activeDotColor,
  });
}

class LowerStackInputs{
  final Color truckyWordColor;
  final Color secondTextColor;
  final Color stackBackGroundColor;
  final String stackBackGroundImageUrl;
  final String description;

  const LowerStackInputs({
    required this.truckyWordColor,
    required this.secondTextColor,
    required this.stackBackGroundColor,
    required this.stackBackGroundImageUrl,
    required this.description
});
}