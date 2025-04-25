import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/res/app_sizes.dart';
import 'package:flutter_base/src/config/res/color_manager.dart';
import 'package:flutter_base/src/config/res/constants_manager.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/extensions/sized_box_helper.dart';
import 'package:flutter_base/src/core/widgets/image_widgets/cached_image.dart';


class ImageSlider extends StatefulWidget {
  final Color? activeColor;
  final Color? inActiveColor;
  final List<String> images;
  final double? height;
  const ImageSlider({
    super.key,
    required this.images,
    this.activeColor,
    this.inActiveColor,
    this.height,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => CachedImage(
            url: widget.images[itemIndex],
            fit: BoxFit.fill,
          ),
          options: CarouselOptions(
            height: widget.height ?? context.mediaQuery.size.width * .2,
            aspectRatio: ConstantManager.customImageSliderAspectRatio,
            viewportFraction: 1,
            initialPage: ConstantManager.zero,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
          ),
        ),
        15.szH,
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: AppSize.sW30,
                      height: AppSize.sH6,
                      margin: EdgeInsets.symmetric(horizontal: AppMargin.mW2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppCircular.r5),
                        color: value == index
                            ? widget.activeColor ?? AppColors.primaryColor
                            : widget.inActiveColor ?? Colors.grey,
                      ),
                    ),
              )
            );
          },
        )
      ],
    );
  }
}
