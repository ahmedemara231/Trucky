import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import '../../../../config/res/constants_manager.dart';
import '../models/response.dart';

abstract interface class OnBoardingDataSource{
  Future<BaseModel<OnBoardingResponse>> getOnBoardingData();
}

class OnBoardingDataSourceImpl extends OnBoardingDataSource{
  @override
  Future<BaseModel<OnBoardingResponse>> getOnBoardingData() async{
    final result = await sl<NetworkService>().callApi<OnBoardingResponse>(
        NetworkRequest(
            method: RequestMethod.get,
            path: ApiConstants.onboarding
        ),
      mapper: (json) => OnBoardingResponse.fromJson(json),
    );
    return result;
  }

}