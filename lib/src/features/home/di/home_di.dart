import '../../../config/res/constants_manager.dart';
import '../data/imports/data_imports.dart';

void setUpHomeDependencies() {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
}
