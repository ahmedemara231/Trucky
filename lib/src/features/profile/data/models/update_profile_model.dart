import 'package:flutter_base/src/features/auth/send_otp/data/models/send_otp_response.dart';

import '../../../../core/shared/models/user_data.dart';

class UpdateProfileModel{
  String msg;
  UserData model;

  UpdateProfileModel({required this.msg, required this.model});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> profileJson) => UpdateProfileModel(
    msg: profileJson['msg'],
    model: UserData.fromJson(profileJson['data']),
  );
}