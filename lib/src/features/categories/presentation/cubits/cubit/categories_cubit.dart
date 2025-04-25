import 'package:flutter_base/src/features/categories/presentation/cubits/cubit/categories_state.dart';
import 'package:flutter_base/src/features/search/data/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/base_state.dart';
import '../../../data/imports/imports.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit({
    required this.categoriesRepo,
    required this.searchRepo,
}) : super(CategoriesState.initial());
  CategoriesRepo categoriesRepo;
  SearchRepo searchRepo;

  Future<void> getAllCategories(int currentPage)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await categoriesRepo.getAllCategories(currentPage);
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              appCategories: success.data.categories
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }


  // Future<void> getProviders(FilterProviders filter)async{
  //   emit(state.copyWith(baseStatus: BaseStatus.loading));
  //   final result = await searchRepo.getProviders(filter);
  //   result.when(
  //         (success) => emit(
  //             state.copyWith(
  //                 baseStatus: BaseStatus.success,
  //                 model: success.data
  //             )),
  //         (error) => emit(
  //             state.copyWith(
  //                 baseStatus: BaseStatus.error,
  //                 msg: error.message
  //             )),
  //   );
  // }
}
