part of '../imports/imports.dart';

enum ReportType{contact, complaint, suggestion}
enum ReportStatus{newOne, processing, finished}

abstract interface class ContactAndReportsDataSource{
  Future<BaseModel<String>> contactUs(ContactUsBody body);
  Future<BaseModel<String>> sendReport(SendReportBody body);
  Future<BaseModel<ReportsResponse>> getReport({
    required ReportType type,
    required ReportStatus status,
    required int currentPage
});

}

class ContactAndReportsDataSourceImpl implements ContactAndReportsDataSource{

  @override
  Future<BaseModel<String>> contactUs(ContactUsBody body) async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.contact,
          body: body.toJson(),
          isFormData: true
        ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<String>> sendReport(SendReportBody body) async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
          method: RequestMethod.post,
          path: ApiConstants.contact,
          body: body.toJson(),
        ),
      mapper: (json) => json['msg'],
    );

    return result;
  }

  @override
  Future<BaseModel<ReportsResponse>> getReport({
    required ReportType type,
    required ReportStatus status,
    required int currentPage
  }) async{
    final result = await sl<NetworkService>().callApi<ReportsResponse>(
      NetworkRequest(
          method: RequestMethod.get,
          path: ApiConstants.getAllContacts,
          queryParameters: {
            'type' : type.name,
            'status' : status.name,
            'page' : currentPage
          },
      ),
      mapper: (json) => ReportsResponse.fromJson(json['data'])
    );

    return result;
  }
}