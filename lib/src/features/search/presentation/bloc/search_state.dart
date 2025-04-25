part of '../imports/imports.dart';

final class SearchState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final GetProviderModel? categoriesModel;
  // final SearchScreenInputsToMakeResult? inputs;
  final FilterProviders? filterProviders;

  const SearchState({
    required this.baseStatus,
    this.categoriesModel,
    this.filterProviders,
    this.msg = ConstantManager.emptyText,
  });

  factory SearchState.initial() {
    return SearchState(
      baseStatus: BaseStatus.initial,
      categoriesModel: GetProviderModel(providers: [], msg: '', pagination: null),
      filterProviders: const FilterProviders(name: ''),
    );
  }

  SearchState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    FilterProviders? filterProviders,
    String? enteredPattern,
    GetProviderModel? categoriesModel,
  }) {
    return SearchState(
      msg: msg?? this.msg,
      baseStatus: baseStatus ?? this.baseStatus,
      filterProviders: filterProviders?? this.filterProviders,
      categoriesModel: categoriesModel?? this.categoriesModel,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    filterProviders,
    categoriesModel,
    msg,
  ];
}