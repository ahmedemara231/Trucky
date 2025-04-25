part of '../imports/imports.dart';

class UpperImage extends StatelessWidget {
  final String imageUrl;
  const UpperImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
        height: context.height / 2.5,
        child: CachedImage(url: imageUrl)
            .animate(key: ValueKey(imageUrl))
            .fade(duration: 500.milliseconds)
    );
  }
}
