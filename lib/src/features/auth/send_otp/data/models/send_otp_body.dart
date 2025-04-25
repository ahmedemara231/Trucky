import 'package:flutter_base/src/config/language/languages.dart';
import 'package:flutter_base/src/core/helpers/helpers.dart';

import '../../../../../core/notification/notification_service.dart';

class SendOtpBody{
  String? phone;
  String? code;
  String? deviceId;
  String? deviceType;
  String? macAddress;
  String? language;

  SendOtpBody({
    this.phone,
    this.code,
    this.deviceId,
    this.deviceType,
    this.macAddress,
    this.language,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'code': code,
    'device_id': NotificationService.deviceToken,
    'device_type': Helpers.deviceType,
    'mac_address': '112234',
    'lang': Languages.currentLanguage.languageCode,
  };
}