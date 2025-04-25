import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/features/auth/complete_profile/presentation/imports/imports.dart';
import 'package:flutter_base/src/features/contact_us_reports/presentation/imports/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportDetailsWidgets extends StatelessWidget {

  final String complaintTitle;
  final String complaintText;
  final String? managementResponse;
  final String image;
  const ReportDetailsWidgets({super.key,
    required this.complaintTitle,
    required this.complaintText,
    required this.managementResponse,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithTextField(
            title: LocaleKeys.complaintTitle,
            hintText: complaintTitle,
            onEnterTitle: (title) {},
            readOnly: true,
          ),
          TitleWithTextField(
            title: LocaleKeys.complaintText,
            hintText: complaintText,
            onEnterTitle: (title) {},
            readOnly: true,
            inputType: TextInputType.multiline,
          ),
          AttachmentsWidget(image: image),
          Visibility(
            visible: managementResponse != null,
            child: TitleWithTextField(
              title: LocaleKeys.managementResponse,
              hintText: managementResponse?? '',
              onEnterTitle: (title) {},
              readOnly: true,
              inputType: TextInputType.multiline,
            ),
          ),
        ],
      ),
    );
  }
}
