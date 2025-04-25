import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/helpers/cache_service.dart';
import 'package:flutter_base/src/core/helpers/status_builder.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/core/widgets/custom_loading.dart';
import 'package:flutter_base/src/core/widgets/image_widgets/cached_image.dart';
import 'package:flutter_base/src/features/on_boarding/data/models/main_screen_inputs.dart';
import 'package:flutter_base/src/features/on_boarding/data/models/response.dart';
import 'package:flutter_base/src/features/on_boarding/data/repo/repo.dart';
import 'package:flutter_base/src/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter_base/src/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../config/res/color_manager.dart';
import '../../../../config/res/constants_manager.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../auth/sign_up/presentation/imports/imports.dart';

part '../screens/view.dart';
part '../widgets/dots_indicator.dart';
part '../widgets/lower_stack.dart';
part '../widgets/upper_image.dart';
part '../widgets/on_boarding_main_screen.dart';
part '../screens/back_ground.dart';
part '../widgets/floating_button.dart';