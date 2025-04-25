part of '../imports/imports.dart';

abstract interface class NotificationDataSource{
  Future<BaseModel<NotificationResponse>> getNotifications(int currentPage);
  Future<BaseModel<String>> deleteSingleNotification(String notificationId);
  Future<BaseModel<String>> deleteAllNotifications();
  Future<BaseModel<int>> getNotificationsNumber();
}

class NotificationDataSourceImpl extends NotificationDataSource{
  @override
  Future<BaseModel<NotificationResponse>> getNotifications(int currentPage) async{
    final result = sl<NetworkService>().callApi<NotificationResponse>(
        NetworkRequest(
          method: RequestMethod.get,
          path: ApiConstants.getNotifications,
          queryParameters: {'page' : currentPage}
        ),
      mapper: (json) => NotificationResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<BaseModel<String>> deleteSingleNotification(String notificationId) async{
    final result = await sl<NetworkService>().callApi<String>(
        NetworkRequest(
          method: RequestMethod.delete,
          path: ApiConstants.deleteSingleNotification+notificationId,
        ),
      mapper: (json) => json['msg'],
    );
    return result;
  }

  @override
  Future<BaseModel<String>> deleteAllNotifications() async{
    final result = await sl<NetworkService>().callApi<String>(
      NetworkRequest(
        method: RequestMethod.delete,
        path: ApiConstants.deleteAllNotifications,
      ),
      mapper: (json) => json['msg'],
    );
    return result;
  }

  @override
  Future<BaseModel<int>> getNotificationsNumber() async{
    final result = await sl<NetworkService>().callApi<int>(
      NetworkRequest(
        method: RequestMethod.get,
        path: ApiConstants.getNotificationsCount,
      ),
      mapper: (json) => (json['data']['count'] as int),
    );
    return result;
  }

}