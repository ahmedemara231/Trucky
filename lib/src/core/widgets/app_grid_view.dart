import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/categories/presentation/imports/categories_imports.dart';

class ProvidersGridView extends StatelessWidget {

  final List<dynamic> providers;
  const ProvidersGridView({super.key,
    required this.providers,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: providers.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h
      ),
      itemBuilder: (context, index) => StackHolderWidget(
        model: providers[index],
      ),
    ).defaultAppScreenPadding();
  }
}