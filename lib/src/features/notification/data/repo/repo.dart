part of '../imports/imports.dart';

abstract interface class NotificationRepo{
  Future<Result<BaseModel<NotificationResponse>, Failure>> getNotifications(int currentPage);
  Future<Result<BaseModel<String>, Failure>> deleteSingleNotification(String notificationId);
  Future<Result<BaseModel<String>, Failure>> deleteAllNotifications();
  Future<Result<BaseModel<int>, Failure>> getNotificationsNumber();
}

class NotificationRepoImpl extends NotificationRepo{
  NotificationDataSource dataSource;
  NotificationRepoImpl({required this.dataSource});

  @override
  Future<Result<BaseModel<NotificationResponse>, Failure>> getNotifications(int currentPage) async{
    return dataSource.getNotifications(currentPage).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> deleteSingleNotification(String notificationId) async{
    return dataSource.deleteSingleNotification(notificationId).handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> deleteAllNotifications() async{
    return dataSource.deleteAllNotifications().handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<int>, Failure>> getNotificationsNumber() async{
    return dataSource.getNotificationsNumber().handleCallbackWithFailure();
  }
}