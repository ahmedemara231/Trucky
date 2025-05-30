import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/assets.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/core/extensions/int.dart';
import 'package:flutter_base/src/core/extensions/list.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/helpers/helpers.dart';
import 'package:flutter_base/src/core/helpers/status_builder.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_base/src/core/widgets/app_bar.dart';
import 'package:flutter_base/src/core/widgets/app_refresh_indicator.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/core/widgets/buttons/loading_button.dart';
import 'package:flutter_base/src/core/widgets/custom_loading.dart';
import 'package:flutter_base/src/features/auth/complete_profile/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_response.dart';
import 'package:flutter_base/src/features/profile/data/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auth/smart_auth.dart';

import '../../../../config/res/color_manager.dart';
import '../../../../config/res/constants_manager.dart';
import '../../../../core/helpers/cache_service.dart';
import '../../../../core/shared/base_state.dart';
import '../../../../core/shared/models/user_data.dart';
import '../../../../core/widgets/validation_host.dart';
import '../../../auth/send_otp/presentation/imports/imports.dart';
import '../widgets/timer.dart';

part '../screens/change_phone.dart';
part '../screens/change_profile.dart';
part '../screens/profile.dart';
part '../widgets/change_phone_texts.dart';
part '../cubit/profile_cubit.dart';
part '../cubit/profile_state.dart';
part '../screens/otp.dart';