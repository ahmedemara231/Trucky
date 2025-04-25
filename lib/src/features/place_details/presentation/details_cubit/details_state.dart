import 'package:equatable/equatable.dart';
import '../../../../config/res/constants_manager.dart';
import '../../../../core/shared/base_state.dart';
import '../../data/models/offers.dart';
import '../../data/models/products.dart';
import '../../data/models/provider_details.dart';

class BaseStatusWithData<T>{
  final BaseStatus baseStatus;
  final String? msg;
  final T data;

  BaseStatusWithData({
    required this.baseStatus,
    this.msg,
    required this.data,
  });
}

final class DetailsState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final BaseStatusWithData<bool>? checkStatus;
  final BaseStatusWithData<ProviderDetailsModel>? providerDetailsModel;

  final List<Products>? products;
  final List<Offers>? offers;

  const DetailsState({
    required this.baseStatus,
    this.msg = ConstantManager.emptyText,
    required this.providerDetailsModel,
    required this.checkStatus,
    required this.products,
    required this.offers,
  });

  factory DetailsState.initial() {
    return const DetailsState(
        baseStatus: BaseStatus.initial,
        checkStatus: null,
        providerDetailsModel: null,
        products: null,
        offers: null,
    );
  }

  DetailsState copyWith({
    BaseStatus? baseStatus,
    BaseStatusWithData<ProviderDetailsModel>? providerDetailsModel,
    String? msg,
    BaseStatusWithData<bool>? checkStatus,
    List<Products>? products,
    List<Offers>? offers,
  }) {
    return DetailsState(
      baseStatus: baseStatus ?? this.baseStatus,
      checkStatus: checkStatus?? this.checkStatus,
      products: products?? this.products,
      offers: offers?? this.offers,
      providerDetailsModel: providerDetailsModel?? this.providerDetailsModel,
      msg: msg ?? this.msg,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    products,
    offers,
    checkStatus,
    providerDetailsModel,
    msg,
  ];
}
