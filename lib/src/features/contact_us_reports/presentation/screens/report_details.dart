import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_base/src/core/widgets/app_bar.dart';
import 'package:flutter_base/src/core/widgets/app_text.dart';
import 'package:flutter_base/src/features/contact_us_reports/data/models/get_reports_response.dart';
import 'package:flutter_base/src/features/contact_us_reports/presentation/widgets/report_details_widgets.dart';

class ReportDetails extends StatelessWidget {

  final Reports report;
  const ReportDetails({super.key,
    required this.report,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppText(LocaleKeys.reports, fontWeight: FontWeight.bold),
      ),
      body: ReportDetailsWidgets(
        complaintTitle: report.title?? LocaleKeys.noTitle,
        complaintText: report.message?? LocaleKeys.noDescription,
        image: report.image!,
        managementResponse: report.reply,
      ).defaultAppScreenPadding()
    );
  }
}
