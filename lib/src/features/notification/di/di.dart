import '../../../config/res/constants_manager.dart';
import '../data/imports/imports.dart';

void setUpNotificationDependencies() {
  sl.registerLazySingleton<NotificationRepo>(
        () => NotificationRepoImpl(
      dataSource: sl<NotificationDataSource>(),
    ),
  );

  sl.registerLazySingleton<NotificationDataSource>(
        () => NotificationDataSourceImpl(),
  );
}
