import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/core/shared/models/app_categories.dart';
import 'package:flutter_base/src/features/categories/data/models/categories_response.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../config/res/constants_manager.dart';

part '../data_source/categories_data_source.dart';
part '../repo/categories_repo.dart';