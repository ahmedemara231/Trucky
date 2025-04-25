import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/core/shared/models/app_categories.dart';
import 'package:flutter_base/src/features/categories/data/models/get_providers_model.dart';
import '../../../../../config/res/constants_manager.dart';
import '../../../../../core/shared/base_state.dart';

final class CategoriesState extends Equatable {
  final BaseStatus baseStatus;
  final String? msg;
  final GetProviderModel? model;
  final List<AppCategories>? appCategories;

  const CategoriesState({
    required this.baseStatus,
    this.msg = ConstantManager.emptyText,
    this.model,
    this.appCategories,
  });

  factory CategoriesState.initial() {
    return const CategoriesState(
      baseStatus: BaseStatus.initial,
      model: null,
      appCategories: null,
    );
  }

  CategoriesState copyWith({
    BaseStatus? baseStatus,
    GetProviderModel? model,
    List<AppCategories>? appCategories,
    String? msg,
  }) {
    return CategoriesState(
      baseStatus: baseStatus ?? this.baseStatus,
      appCategories: appCategories?? this.appCategories,
      msg: msg ?? this.msg,
      model: model?? this.model,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    model,
    appCategories,
    msg,
  ];
}
