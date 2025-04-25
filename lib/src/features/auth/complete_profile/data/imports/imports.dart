import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/features/auth/complete_profile/data/models/complete_profile_request_body.dart';
import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_response.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../config/res/constants_manager.dart';

part '../repo/complete_profile_repo.dart';
part '../data_source/complete_profile_data_source.dart';