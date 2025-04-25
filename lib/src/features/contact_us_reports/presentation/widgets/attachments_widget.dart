part of '../imports/imports.dart';

class AttachmentsWidget extends StatelessWidget {
  final String image;
  const AttachmentsWidget({super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(LocaleKeys.attachments, fontWeight: FontWeight.bold, fontSize: 16.sp),
        Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r)
            ),
            width: 60.w, height: 60.h,
            child: CachedImage(url: image)
        )

        // Row(
        //   children: List.generate(
        //       image.length,
        //           (index) => Container(
        //               width: 60.w, height: 60.h,
        //               clipBehavior: Clip.antiAliasWithSaveLayer,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(5.r)
        //               ),
        //               child: CachedImage(url: image[index])
        //           )
        //   ),
        // ),
      ],
    );
  }
}
