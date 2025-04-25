import 'dart:developer';

import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_body.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../../../../config/res/constants_manager.dart';
import '../../../sign_up/data/models/register_response.dart';
import '../models/send_otp_response.dart';

part '../data_source/otp_data_source.dart';
part '../repo/otp_repo.dart';
