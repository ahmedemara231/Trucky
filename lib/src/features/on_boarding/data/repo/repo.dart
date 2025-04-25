import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/features/on_boarding/data/data_source/on_boarding_data_source.dart';
import 'package:multiple_result/multiple_result.dart';
import '../models/response.dart';

abstract interface class OnBoardingRepo{
  Future<Result<BaseModel<OnBoardingResponse>, Failure>> getOnBoardingData();
}

class OnBoardingRepoImpl extends OnBoardingRepo{
  final OnBoardingDataSource dataSource;
  OnBoardingRepoImpl(this.dataSource);

  @override
  Future<Result<BaseModel<OnBoardingResponse>, Failure>> getOnBoardingData() async{
    return dataSource.getOnBoardingData().handleCallbackWithFailure();
  }

}