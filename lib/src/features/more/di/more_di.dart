import 'package:flutter_base/src/features/more/data/imports/data_imports.dart';
import 'package:flutter_base/src/features/more/presentation/imports/imports.dart';

import '../../../config/res/constants_manager.dart';


void setUpMoreDi(){
  sl.registerLazySingleton<MoreDataSource>( () => MoreDataSourceImpl());
  sl.registerLazySingleton<MoreRepository>(() => MoreRepositoryImpl(moreDataSource: sl<MoreDataSource>()));
  sl.registerFactory(() => MoreCubit(sl<MoreRepository>()));
}