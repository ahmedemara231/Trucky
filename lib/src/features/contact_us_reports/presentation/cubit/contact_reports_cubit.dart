part of '../imports/imports.dart';

class ContactReportsCubit extends Cubit<ContactReportsState> {
  ContactReportsCubit(this.repo) : super(ContactReportsState.initial());

  ContactAndReportsRepo repo;
  Future<void> contactUs(ContactUsBody body)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.contactUs(body);
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                msg: success.data
              )),
          (error) => emit(
              state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
              )),
    );
  }

  Future<void> sendReport(SendReportBody body)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.sendReport(body);
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.data
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  Future<void> getReports({
    required ReportType type,
    required ReportStatus status,
    required int currentPage
  })async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getReport(
      type: type,
      status: status,
      currentPage: currentPage
    );
    result.when(
          (success) => emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            reports: success.data
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }
}