part of '../imports/presentaion_imports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeState.initial());
  final HomeRepository repo;

  Future<void> fetchHomeData() async {
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.fetchHomeData();
    result.when(
          (success) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  homeDataModel: success.data
              )),
          (error) => emit(state.copyWith(
            baseStatus: BaseStatus.error,
            errorMessage: error.message
          )),
    );
  }

  void setSearchPattern(String? pattern){
    emit(state.copyWith(pattern: pattern));
  }
}