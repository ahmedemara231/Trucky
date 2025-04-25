part of '../imports/imports.dart';

class SelectImageContainer extends StatefulWidget {

  void Function(List<File> selectedImages) onSelectImages;
  SelectImageContainer({super.key,
    required this.onSelectImages,
  });

  @override
  State<SelectImageContainer> createState() => _SelectImageContainerState();
}

class _SelectImageContainerState extends State<SelectImageContainer> {
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        DottedBorder(
          color: Colors.grey, // Border color
          strokeWidth: 1.5, // Border thickness
          dashPattern: const [6, 3], // Dashes pattern (6px dash, 3px space)
          borderType: BorderType.RRect, // Rounded rectangle border
          radius: const Radius.circular(8), // Border radius
          child: InkWell(
            onTap: () async {
              final result = await Helpers.getImages();
              setState(() => selectedImages.addAll(result));
              widget.onSelectImages(selectedImages);
            },
            child: Container(
              height: 100, // Adjust height
              width: double.infinity, // Full width
              color: Colors.white, // Background color
              child:  Column(
                spacing: 5.h,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt, color: Colors.grey, size: 32), // Camera icon
                  AppText(
                    LocaleKeys.pickImage,
                    fontSize: 16.sp,
                    color: Colors.grey,
                  ), // Arabic text
                ],
              ),
            ),
          ),
        ),
        Row(
          children: List.generate(
            selectedImages.length, 
                (index) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        width: 60.w, height: 60.h,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r)
                        ),
                        child: Image.file(selectedImages[index], fit: BoxFit.fill,)
                    ).paddingTop(20.h).paddingRight(18.w),
                    IconButton(
                        onPressed: () => setState(() => selectedImages.remove(selectedImages[index])),
                        icon: Container(
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle
                          ),
                          child: Icon(Icons.close_outlined, color: Colors.white, size: 18.sp,),
                        )
                    )
                    // delete icon
                  ],
                ),
          ),
        )
      ],
    );
  }
}