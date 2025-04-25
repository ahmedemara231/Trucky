part of '../imports/imports.dart';


abstract interface class ContactAndReportsRepo{
  Future<Result<BaseModel<String>, Failure>> contactUs(ContactUsBody body);
  Future<Result<BaseModel<String>, Failure>> sendReport(SendReportBody body);
  Future<Result<BaseModel<ReportsResponse>, Failure>> getReport({
    required ReportType type,
    required ReportStatus status,
    required int currentPage
  });
}

class ContactAndReportsRepoImpl implements ContactAndReportsRepo{

  ContactAndReportsDataSource dataSource;
  ContactAndReportsRepoImpl(this.dataSource);

  @override
  Future<Result<BaseModel<String>, Failure>> contactUs(ContactUsBody body) async{
    return dataSource.contactUs(body).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> sendReport(SendReportBody body) async{
    return dataSource.sendReport(body).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<ReportsResponse>, Failure>> getReport({
    required ReportType type,
    required ReportStatus status,
    required int currentPage
  }) async{
    return dataSource
        .getReport(type: type, status: status, currentPage: currentPage)
        .handleCallbackWithFailure();
  }


}