import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/features/search/data/models/city.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../config/res/constants_manager.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_request.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/shared/base_model.dart';
import '../models/filter_providers.dart';
import '../../../categories/data/models/get_providers_model.dart';

part '../data_source/search_data_source.dart';
part '../repo/search_repo.dart';