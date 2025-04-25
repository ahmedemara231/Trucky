part of '../imports/categories_imports.dart';

enum SecondChild {text, rate}

class RatesStatusAndNumbers extends StatelessWidget {
  final SecondChild child;
  final String title;
  final String? value;
  final int? rate;

  const RatesStatusAndNumbers({super.key,
    required this.child,
    required this.title,
    this.value,
    this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(title, color: AppColors.primaryColor),
            const Spacer(),
            Visibility(
                visible: child == SecondChild.text,
                child: AppText(value??'', color: AppColors.primaryColor)
            ),

            Visibility(
              visible: child == SecondChild.rate,
              child: RatingBarIndicator(
                rating: rate?.toDouble()??0,
                unratedColor: Colors.grey[300],
                itemBuilder: (context, index) => SvgPicture.asset(
                  Assets.iconsRatingStar,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 15.sp,
                direction: Axis.horizontal,
                itemPadding: EdgeInsets.all(3.w),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const AppDivider()
      ],
    );
  }
}