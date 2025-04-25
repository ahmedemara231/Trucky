import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/features/place_details/data/models/add_rate_body.dart';
import 'package:flutter_base/src/features/place_details/data/models/check_response.dart';
import 'package:flutter_base/src/features/place_details/data/models/offers.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../config/res/constants_manager.dart';
import '../models/products.dart';
import '../models/provider_details.dart';

part '../data_source/data_source.dart';
part '../repo/repo.dart';