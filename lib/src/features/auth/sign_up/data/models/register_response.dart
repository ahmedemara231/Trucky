import 'package:flutter_base/src/core/shared/models/user_data.dart';

import '../../../../../core/shared/models/providers.dart';

class RegisterResponse {
  String? key;
  String? msg;
  UserData user;

  RegisterResponse({required this.key, required this.msg, required this.user});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
      key: json['key'],
      msg: json['msg'],
      user: UserData.fromJson(json['data'])
  );
}