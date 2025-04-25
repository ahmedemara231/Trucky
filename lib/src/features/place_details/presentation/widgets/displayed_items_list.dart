import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/offers.dart';
import '../../data/models/products.dart';
import '../imports/categories_imports.dart';

class DisplayedItemsList extends StatelessWidget {
  final DisplayedItemsEnum displayedItemsEnum;
  final List<Products>? products;
  final List<Offers>? offers;

  const DisplayedItemsList({super.key,
    required this.products,
    required this.offers,
    required this.displayedItemsEnum,
  });

  const DisplayedItemsList.products({super.key, required this.products}) :
        displayedItemsEnum = DisplayedItemsEnum.products,
        offers = null;

  const DisplayedItemsList.offers({super.key, required this.offers}) :
        displayedItemsEnum = DisplayedItemsEnum.offers,
        products = null;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Column(
        spacing: 16.h,
        children: [
          if(displayedItemsEnum == DisplayedItemsEnum.products)
            const ViewAll.products()
          else
            const ViewAll.offers(),

          Column(
            children: displayedItemsEnum == DisplayedItemsEnum.products? List.generate(
              products!.length,
                  (index) => DisplayedItems.products(products: products![index]).paddingAll(7),
            ) : List.generate(
              offers!.length,
                  (index) => DisplayedItems.offers(offers: offers![index]).paddingAll(7),
            ),
          ),
        ],
      ),
    );
  }
}