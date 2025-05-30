import 'dart:convert';
import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_base/generated/assets.dart';
import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/config/res/color_manager.dart';
import 'package:flutter_base/src/config/res/constants_manager.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/extensions/list.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/helpers/cache_service.dart';
import 'package:flutter_base/src/core/helpers/status_builder.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_base/src/core/shared/models/app_categories.dart';
import 'package:flutter_base/src/core/widgets/app_bar.dart';
import 'package:flutter_base/src/core/widgets/app_refresh_indicator.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/core/widgets/custom_loading.dart';
import 'package:flutter_base/src/core/widgets/image_widgets/cached_image.dart';
import 'package:flutter_base/src/core/widgets/image_widgets/custom_image_slider.dart';
import 'package:flutter_base/src/features/detect_location/data/location_model.dart';
import 'package:flutter_base/src/features/detect_location/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/home/data/imports/data_imports.dart';
import 'package:flutter_base/src/features/home/data/models/home_data_model.dart';
import 'package:flutter_base/src/features/search/presentation/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../../../../core/shared/models/providers.dart';
import '../../../categories/presentation/imports/categories_imports.dart';
import '../../../place_details/presentation/imports/categories_imports.dart';
import 'package:cached_map_marker/cached_map_marker.dart';

part '../cubit/home_cubit.dart';
part '../cubit/home_state.dart';
part '../screens/home_screen.dart';
part '../widgets/home_body.dart';
part '../widgets/main_sections.dart';
part '../widgets/search_icon.dart';
part '../widgets/some_categories.dart';
part '../widgets/providers_map.dart';
part '../widgets/provider_marker.dart';
