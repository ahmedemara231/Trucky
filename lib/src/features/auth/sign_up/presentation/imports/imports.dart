import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/generated/assets.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_base/src/core/widgets/buttons/loading_button.dart';
import 'package:flutter_base/src/core/widgets/custom_text_field.dart';
import 'package:flutter_base/src/features/auth/send_otp/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/auth/sign_up/data/imports/imports.dart';
import 'package:flutter_base/src/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter_base/src/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auth/smart_auth.dart';
import '../../../../../config/language/locale_keys.g.dart';
import '../../../../../config/res/color_manager.dart';
import '../../../../../config/res/constants_manager.dart';
import '../../../../../core/helpers/helpers.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/widgets/app_text.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/language/languages.dart';
import '../../../../more/presentation/imports/imports.dart';

part '../screens/sign_up_screen.dart';
part '../widgets/change_lang_widget.dart';
part '../widgets/screens_texts.dart';
part '../widgets/phone_field.dart';
part '../widgets/language_items.dart';
