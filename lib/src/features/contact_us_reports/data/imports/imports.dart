import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/core/shared/base_model.dart';
import 'package:flutter_base/src/features/contact_us_reports/data/models/get_reports_response.dart';
import '../../../../config/res/constants_manager.dart';
import '../models/contact_us_body.dart';
import 'package:flutter_base/src/core/error/failure.dart';
import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:multiple_result/multiple_result.dart';

import '../models/send_report_body.dart';


part '../data_source/contact_us_reports_data_source.dart';
part '../repo/contact_us_reports_repo.dart';