part of '../imports/categories_imports.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          LocaleKeys.description,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        const SizedBox(height: 7),
        AppText(
            context.read<DetailsCubit>().detailsState?.data.info?.description?? LocaleKeys.notExist,
            color: Colors.grey
        ),
        const AppDivider()
      ],
    ).paddingSymmetric(vertical: 10.h);
  }
}
