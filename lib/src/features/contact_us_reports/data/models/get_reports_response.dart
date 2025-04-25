import 'package:flutter_base/src/core/shared/models/pagination.dart';

class ReportsResponse {
  List<Reports> reports;
  AppPagination pagination;

  ReportsResponse({
    required this.reports,
    required this.pagination,
  });
  
  factory ReportsResponse.fromJson(Map<String, dynamic> reportsJson) => ReportsResponse(
      reports: (reportsJson['data'] as List)
          .map((e) => Reports.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: AppPagination.fromJson(reportsJson['pagination'])
  );
}

class Reports {
  int id;
  String? title;
  String? message;
  String? image;
  String status;
  String statusText;
  String? reply;

  Reports({
    required this.id,
    required this.title,
    required this.message,
    required this.image,
    required this.status,
    required this.statusText,
    this.reply,
  });

  factory Reports.fromJson(Map<String, dynamic> json) => Reports(
    id: json['id'],
    title: json['title'],
    message: json['message'],
    image: json['image'],
    status: json['status'],
    statusText: json['status_text'],
    reply: json['reply'],
  );
}