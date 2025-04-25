part of '../imports/presentaion_imports.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(.2)
      ),
      child: IconButton(
          onPressed: () => Go.to(const SearchScreen()),
          icon: SvgPicture.asset(Assets.iconsSearch)
      ),
    ).paddingAll(8.r);
  }
}
