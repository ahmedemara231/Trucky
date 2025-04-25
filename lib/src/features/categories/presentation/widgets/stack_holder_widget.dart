part of '../imports/categories_imports.dart';

class StackHolderWidget extends StatelessWidget {

  final Providers model;
  const StackHolderWidget({super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Go.to(PlaceDetails(providerId: model.id)),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r)
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedImage(url: model.image!),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    AppColors.black.withOpacity(0.5)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0, 0.6, 1],
                ),
              ),
            ),
            ListTile(
              title: AppText(model.name ?? '', fontSize: 14.sp, color: Colors.white),
              subtitle: Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16.sp, color: Colors.white),
                  Expanded( // Ensures text doesn't overflow
                    child: AppText(model.locations[0].mapDesc ?? 'No Address',
                      fontSize: 12.sp,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_circle_left_outlined, color: Colors.white, size: 20.sp),
            )
          ],
        ),
      ),
    );
  }
}
