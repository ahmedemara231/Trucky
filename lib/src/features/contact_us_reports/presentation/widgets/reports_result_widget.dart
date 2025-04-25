part of '../imports/imports.dart';

// class ReportsResultWidget extends StatelessWidget {
//   final int reportStatusIndex;
//   final List<Reports>? reports;
//
//   const ReportsResultWidget({super.key,
//     required this.reportStatusIndex,
//     required this.reports
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 16.h,
//       children: [
//         Column(
//           children: List.generate(reports?.length?? 0, (index) => InkWell(
//               onTap: () => Go.to(ReportDetails(report: reports![index])),
//               child: ReportInputs(
//                 id: reports![index].id.toString(),
//                 statusText: reports?[index].statusText?? LocaleKeys.noTitle,
//               )
//           ),),
//         ),
//         Visibility(
//             visible: reportStatusIndex == 0,
//             child: DefaultButton(
//               onTap: ()async {
//                 Go.to(BlocProvider.value(
//                     value: context.read<ContactReportsCubit>(),
//                     child: const MakeReports()
//                 ));
//               },
//               title: LocaleKeys.addComplaint,
//               borderRadius: BorderRadius.circular(40.r),
//               fontWeight: FontWeight.bold, fontSize: 16.sp,
//             )
//         ),
//       ],
//     );
//   }
// }

class ReportsResultWithListView extends StatelessWidget {
  final int reportStatusIndex;
  final ReportStatus status;
  const ReportsResultWithListView({super.key,
    required this.reportStatusIndex,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: context.height - 200,
          child: EasyPagination<BaseModel<ReportsResponse>, Reports>.listViewRanking(
            key: UniqueKey(),
            asyncCall: (currentPage) async => sl<ContactAndReportsDataSource>().getReport(
                type: ReportType.complaint,
                status: status,
                currentPage: currentPage
            ),
            mapper: (response) => DataListAndPaginationData<Reports>(
                data: response.data.reports,
                paginationData: PaginationData(totalPages: response.data.pagination.totalPages)
            ),
            itemBuilder: (data, index) => InkWell(
                onTap: () => Go.to(ReportDetails(report: data[index])),
                child: ReportInputs(
                  id: data[index].id.toString(),
                  statusText: data[index].statusText,
                )
            ),
            loadingBuilder: CustomLoading.showLoadingView(),
          ),
        ),

        Visibility(
            visible: reportStatusIndex == 0,
            child: DefaultButton(
              onTap: ()async {
                Go.to(BlocProvider.value(
                    value: context.read<ContactReportsCubit>(),
                    child: const MakeReports()
                ));
              },
              title: LocaleKeys.addComplaint,
              borderRadius: BorderRadius.circular(40.r),
              fontWeight: FontWeight.bold, fontSize: 16.sp,
            )
        ),
      ],
    );
  }
}


// class ReportsViewHandler extends StatelessWidget {
//   final int reportStatusIndex;
//   const ReportsViewHandler({super.key,
//     required this.reportStatusIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ContactReportsCubit, ContactReportsState>(
//       builder: (context, state) => StatusBuilder(
//         status: state.baseStatus,
//         placeHolder: '',
//         builder: (placeHolder, isLoading) => isLoading?
//         CustomLoading.showLoadingView() :
//         ReportsResultWithListView(reportStatusIndex: reportStatusIndex, reports: state.reports?.reports)
//       ),
//     );
//   }
// }