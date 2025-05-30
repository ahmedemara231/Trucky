import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/config/res/color_manager.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/helpers/helpers.dart';
import 'package:flutter_base/src/core/helpers/status_builder.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import 'package:flutter_base/src/core/shared/models/app_categories.dart';
import 'package:flutter_base/src/core/shared/models/providers.dart';
import 'package:flutter_base/src/core/widgets/app_bar.dart';
import 'package:flutter_base/src/core/widgets/app_grid_view.dart';
import 'package:flutter_base/src/core/widgets/app_refresh_indicator.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/core/widgets/custom_loading.dart';
import 'package:flutter_base/src/core/widgets/image_widgets/cached_image.dart';
import 'package:flutter_base/src/core/widgets/paginated_list.dart';
import 'package:flutter_base/src/features/categories/data/imports/imports.dart';
import 'package:flutter_base/src/features/search/data/models/filter_providers.dart';
import 'package:flutter_base/src/features/categories/presentation/cubits/cubit/categories_cubit.dart';
import 'package:flutter_base/src/features/categories/presentation/cubits/cubit/categories_state.dart';
import 'package:flutter_base/src/features/home/presentation/imports/presentaion_imports.dart';
import 'package:flutter_base/src/features/search/presentation/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/res/constants_manager.dart';
import '../../../../core/shared/base_model.dart';
import '../../../../core/widgets/empty_list.dart';
import '../../../place_details/presentation/imports/categories_imports.dart';
import '../../../search/data/imports/imports.dart';
import '../../data/models/categories_response.dart';
import '../../data/models/get_providers_model.dart';

part '../widgets/category_widget.dart';
part '../screens/categories.dart';
part '../screens/category_stack_holder.dart';
part '../widgets/stack_holder_widget.dart';