import 'dart:developer';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../config/res/constants_manager.dart';
import '../../../../core/error/failure.dart';
import '../models/store_location_model.dart';

part '../data_source/location_data_source.dart';
part '../repo/location_repo.dart';