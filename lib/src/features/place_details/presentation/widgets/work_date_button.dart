part of '../imports/categories_imports.dart';

class WorkDateButton extends StatelessWidget {
  final String buttonTitle;
  final List<WorkTime> times;

  const WorkDateButton({super.key,
    required this.buttonTitle,
    required this.times
  });

  void showWorkDatesBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (context) => WorkTimesWidget(
          times: times,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => showWorkDatesBottomSheet(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.r),
              side: const BorderSide(color: AppColors.forth),
          )
        ),
        child: SizedBox(
          width: context.width,
          child: AppText(
            textAlign: TextAlign.center,
            buttonTitle,
            color: AppColors.forth,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        )
    );
  }
}

class WorkTimesWidget extends StatelessWidget {

  final List<WorkTime> times;
  const WorkTimesWidget({super.key,
    required this.times,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SheetDivider(),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Row(
                  children: [
                    AppText(times[index].day),
                    const Spacer(),
                    if(times[index].isOffDay == 0)
                      Row(
                        spacing: 5.w,
                        children: [
                          AppText(LocaleKeys.from),
                          AppText(times[index].startTime),
                          AppText(LocaleKeys.to),
                          AppText(times[index].endTime),
                        ],
                      )else
                        AppText(LocaleKeys.closed)
                  ],
                ).paddingAll(7),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: times.length
          ).paddingAll(12),
        ),
      ],
    );
  }
}
