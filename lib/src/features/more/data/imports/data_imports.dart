import 'package:flutter_base/src/core/extensions/error_handler_extension.dart';
import 'package:flutter_base/src/core/network/api_endpoints.dart';
import 'package:flutter_base/src/core/network/network_request.dart';
import 'package:flutter_base/src/core/network/network_service.dart';
import 'package:flutter_base/src/features/more/data/models/about_terms_and_privacy_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../config/res/constants_manager.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/shared/base_model.dart';
import '../models/change_lang_model.dart';
import '../models/question_and_answers_model.dart';

part '../data_sources/more_data_source.dart';
part '../repositories/more_repository.dart';