part of '../imports/imports.dart';

class ReportsStatus extends StatefulWidget {

  void Function (ReportStatus status, int sectionIndex) onSelectSection;
  ReportsStatus({super.key,
    required this.onSelectSection,
  });

  @override
  State<ReportsStatus> createState() => _ReportsStatusState();
}

class _ReportsStatusState extends State<ReportsStatus> {
  final List<String> titles = [
    LocaleKeys.newReports,
    LocaleKeys.processing,
    LocaleKeys.finished
  ];

  int currentIndex = 0;

  ReportStatus getReportsStatus(int index){
    switch(titles[index]){
      case 'New Reports':
      case 'جديدة':
        return ReportStatus.newOne;

      case 'Processing':
      case 'جاري المعالجة':
        return ReportStatus.processing;

      case 'Finished':
      case 'منتهية':
        return ReportStatus.finished;

      default:
        return ReportStatus.newOne;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        titles.length,
            (index) => InkWell(
              onTap: () {
                setState(() => currentIndex = index);
                widget.onSelectSection(getReportsStatus(index), index);
              },
              child: AnimatedContainer(
                duration: 200.ms,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: .5),
                  color: currentIndex == index? AppColors.primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8.r)
                ),
                child: AppText(
                  titles[index],
                  fontWeight: FontWeight.w500,
                  color: currentIndex == index? Colors.white : Colors.grey,
                ).paddingAll(12),
              ),
            ),
      ),
    ).paddingSymmetric(horizontal: 8.w);
  }
}
