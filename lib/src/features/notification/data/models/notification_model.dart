import 'package:flutter_base/src/core/shared/models/pagination.dart';

class NotificationResponse{
  final String msg;
  List<NotificationModel> notifications;
  AppPagination pagination;

  NotificationResponse({
    required this.msg,
    required this.notifications,
    required this.pagination
  });
  
  factory NotificationResponse.fromJson(Map<String,dynamic> json)=> NotificationResponse(
      msg: json['msg'],
      pagination: AppPagination.fromJson(json['data']['pagination']),
      notifications: (json['data']['data'] as List)
          .map((e ) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList()
  );
}


class NotificationModel{
  final String type;
  final String title;
  final String body;
  final String createdAt;
  final String id;

  NotificationModel({
    required this.type,
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });
  factory NotificationModel.fromJson(Map<String,dynamic> json) => NotificationModel(
    type: json['type']??'',
    id: json['id']??'',
    title: json['title']??'',
    body: json['body']??'',
    createdAt: json['created_at']??''
  );
}

