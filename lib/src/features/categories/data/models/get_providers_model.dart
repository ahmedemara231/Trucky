import 'package:flutter_base/src/core/shared/models/pagination.dart';
import '../../../../core/shared/models/providers.dart';

class GetProviderModel{
  String msg;
  List<dynamic> providers;
  AppPagination? pagination;

  GetProviderModel({
    required this.msg,
    required this.providers,
    required this.pagination,
  });

  factory GetProviderModel.fromJson(Map<String, dynamic> json) => GetProviderModel(
        msg: json['msg'],
        pagination: AppPagination.fromJson(json['data']['pagination']),
        providers: json['data']['data']
            .map((i) => Providers.fromJson(i as Map<String, dynamic>))
            .toList(),
      );
}