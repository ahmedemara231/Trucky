part of '../imports/presentaion_imports.dart';

class SomeCategories extends StatelessWidget {
  const SomeCategories({super.key,
    required this.items,
  });

  final List<AppCategories> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryWidget(item: items[index]),
          separatorBuilder: (context, index) => SizedBox(width: 10.w,),
          itemCount: items.length
      ),
    );
  }
}
