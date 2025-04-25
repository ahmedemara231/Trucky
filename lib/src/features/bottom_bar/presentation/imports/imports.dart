import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/assets.dart';
import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/config/res/color_manager.dart';
import 'package:flutter_base/src/core/helpers/helpers.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/features/home/presentation/imports/presentaion_imports.dart';
import 'package:flutter_base/src/features/notification/data/imports/imports.dart';
import 'package:flutter_base/src/features/notification/presentation/cubit/notification_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/res/constants_manager.dart';
import '../../../../core/helpers/deep_linking.dart';
import '../../../more/presentation/imports/imports.dart';
import '../../../notification/presentation/imports/imports.dart';
import 'package:badges/badges.dart' as badges;

part '../screens/main.dart';
part '../widgets/bottom_bar_item_widget.dart';
