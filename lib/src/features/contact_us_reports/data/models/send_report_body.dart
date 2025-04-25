import 'dart:io';

import 'package:flutter_base/src/features/contact_us_reports/data/models/contact_us_body.dart';

class SendReportBody extends ContactUsBody{
  List<File> images;
  SendReportBody({this.images = const []});

  @override
  Map<String, dynamic> toJson() {
    return {
      'type' : 'complaint',
      'title' : title,
      'message' : message,
      'image' : images
    };
  }
}