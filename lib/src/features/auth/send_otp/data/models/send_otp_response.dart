import 'package:flutter_base/src/core/shared/models/location.dart';

import '../../../../../core/shared/models/providers.dart';
import '../../../../../core/shared/models/user_data.dart';
import '../../../sign_up/data/models/register_response.dart';

class UserResponse{
  String key;
  String msg;
  UserData userData;

  UserResponse({
    required this.key,
    required this.msg,
    required this.userData
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    key: json['key'],
    msg: json['msg'],
    userData: UserData.fromJson(json['data'])
  );
}