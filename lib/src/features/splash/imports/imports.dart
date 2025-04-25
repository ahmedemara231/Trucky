import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_base/src/features/auth/complete_profile/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/auth/sign_up/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/bottom_bar/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/profile/data/imports/imports.dart';
import 'package:flutter_base/src/features/profile/presentation/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:flutter_base/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config/res/constants_manager.dart';
import '../../../core/helpers/cache_service.dart';
import '../../../core/navigation/navigator.dart';
import '../../../core/notification/notification_service.dart';
import '../../detect_location/presentation/imports/imports.dart';
import '../../on_boarding/presentation/imports/imports.dart';


part '../widgets/animated_text.dart';
part '../screen/splash_screen.dart';
