import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_body.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/notification/notification_service.dart';

class ChangeLangBody extends SendOtpBody{
  ChangeLangBody({
    super.language,
    super.deviceId,
    super.deviceType,
    super.macAddress,
});

  @override
  Map<String, dynamic> toJson() => {
    'phone': phone,
    'code': code,
    'device_id': NotificationService.deviceToken,
    'device_type': Helpers.deviceType,
    'mac_address': '112234',
    'lang': super.language,
  };
}