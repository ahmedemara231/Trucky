import 'package:flutter_base/src/features/contact_us_reports/data/imports/imports.dart';
import '../../../config/res/constants_manager.dart';

void setUpContactReportsDependencies() {
  sl.registerLazySingleton<ContactAndReportsRepo>(
        () => ContactAndReportsRepoImpl(
            sl<ContactAndReportsDataSource>()
    ),
  );

  sl.registerLazySingleton<ContactAndReportsDataSource>(
        () => ContactAndReportsDataSourceImpl(),
  );
}
