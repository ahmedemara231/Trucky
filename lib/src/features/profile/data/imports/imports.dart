import 'dart:io';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_response.dart';
import 'package:flutter_base/src/features/profile/data/models/update_profile_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../config/res/constants_manager.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_request.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/shared/base_model.dart';
import '../../../../core/shared/models/user_data.dart';

part '../data_source/profile_data_source.dart';
part '../repo/profile_repo.dart';