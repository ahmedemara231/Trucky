part of '../imports/imports.dart';

class ReportInputs extends StatelessWidget {
  final String id;
  final String statusText;
  const ReportInputs({super.key,
    required this.id,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        spacing: 10.h,
        children: [
          Row(
            children: [
              AppText(LocaleKeys.complaintNumber, color: Colors.black54, fontSize: 14.sp,),
              const Spacer(),
              AppText(id, color: AppColors.primaryColor, fontSize: 14.sp,),
            ],
          ),
          Row(
            children: [
              AppText(LocaleKeys.complaintStatus, color: Colors.black54, fontSize: 12.sp,),
              const Spacer(),
              AppText(statusText, fontSize: 12.sp, fontWeight: FontWeight.w500,),
            ],
          ),
        ],
      ).paddingAll(8),
    ).paddingAll(8);
  }
}
