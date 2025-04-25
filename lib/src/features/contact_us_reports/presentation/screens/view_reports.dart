part of '../imports/imports.dart';

class ViewReports extends StatelessWidget {
  const ViewReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.reports, fontWeight: FontWeight.bold,),
      ),
      body: BlocProvider(
          create: (context) => ContactReportsCubit(sl<ContactAndReportsRepo>()),
          child: const _ViewReportsBody()
      ),
    );
  }
}

class _ViewReportsBody extends StatefulWidget {
  const _ViewReportsBody({super.key});

  @override
  State<_ViewReportsBody> createState() => _ViewReportsBodyState();
}

class _ViewReportsBodyState extends State<_ViewReportsBody> {
  int currentSectionIndex = 0;
  ReportStatus reportsStatus = ReportStatus.newOne;

  final controller = EasyPaginationController<Reports>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14.h,
      children: [
        ReportsStatus(onSelectSection: (section, sectionIndex) {
          setState(() {
            reportsStatus = section;
            currentSectionIndex = sectionIndex;
          });

        }),

        ReportsResultWithListView(
            status: reportsStatus,
            reportStatusIndex: currentSectionIndex,
        ),



      ],
    ).defaultAppScreenPadding();
  }
}

