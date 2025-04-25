import 'package:flutter_base/src/features/place_details/data/imports/imports.dart';
import 'package:flutter_base/src/features/place_details/data/models/add_rate_body.dart';
import 'package:flutter_base/src/features/place_details/data/models/provider_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/base_state.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this.repo) : super(DetailsState.initial());
  DetailsRepo repo;

  Future<void> getProducts({required int providerId, required int currentPage})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getProductsToSpecificPlace(providerId: providerId, currentPage: currentPage);
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              products: success.data.products
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  Future<void> getOffers({required int providerId, required int currentPage})async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getOffersToSpecificPlace(providerId: providerId, currentPage: currentPage);
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              offers: success.data.offers
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  BaseStatusWithData<ProviderDetailsModel>? get detailsState => state.providerDetailsModel;

  Future<void> showProviderDetails(int id) async{
    emit(state.copyWith(
        providerDetailsModel: BaseStatusWithData(
            baseStatus: BaseStatus.loading,
            data: ProviderDetailsModel.initial(),
        ),
    ));

    final result = await repo.showProviderDetails(id);
    result.when(
          (success) => emit(
          state.copyWith(
            checkStatus: BaseStatusWithData<bool>(
              baseStatus: BaseStatus.success,
              data: success.data.checkStatus
            ),
            providerDetailsModel: BaseStatusWithData<ProviderDetailsModel>(
              baseStatus: BaseStatus.success,
              data: success.data,
          ),
          )),

          (error) => emit(
          state.copyWith(
              providerDetailsModel: BaseStatusWithData(
                  baseStatus: BaseStatus.error,
                  data: ProviderDetailsModel.initial()
              ),
              msg: error.message
          )),
    );
  }

  Future<void> check({required int id, required CheckStatus checkStatus}) async{
    emit(
        state.copyWith(
          baseStatus: BaseStatus.loading,
          checkStatus: BaseStatusWithData<bool>(
              baseStatus: BaseStatus.loading,
              data: false
          ),
        ));
    final result = await repo.check(providerId: id, checkStatus: checkStatus);
    result.when(
          (success) => emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            checkStatus: BaseStatusWithData<bool>(
                baseStatus: BaseStatus.success,
                msg: success.data.msg,
                data: success.data.status
            ),
            msg: success.data.msg,
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

  Future<void> addRate(AddRateBody body)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.addRate(body);
    result.when(
          (success) => emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data,
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }

}