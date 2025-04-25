import 'package:flutter_base/src/core/shared/models/location.dart';

class UserData {
  int id;
  String? name;
  bool isActive;
  bool isProfileCompleted;

  int countryCode;
  int phone;
  int fullPhone;
  int? code;
  String? image;
  Locations? locations;
  String token;

  UserData({
    required this.id,
    required this.name,
    required this.isActive,
    required this.isProfileCompleted,
    required this.countryCode,
    required this.phone,
    required this.fullPhone,
    required this.code,
    required this.image,
    required this.locations,
    required this.token
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>  UserData(
      id: json['id'],
      name: json['name'],
      isActive: json['is_active'],
      isProfileCompleted:  json['is_profile_completed']?? false,
      countryCode: json['country_code'],
      phone: json['phone'],
      fullPhone: json['full_phone'],
      code: json['code'],
      image: json['image'],
      locations: json['locations'] == null? null : Locations.fromJson(json['locations']),
      token: json['token']
  );

  factory UserData.initial() => UserData(
      id: 0,
      name: 'name',
      isActive: false,
      isProfileCompleted: false,
      countryCode: 0,
      phone: 0,
      fullPhone: 0,
      code: 1234,
      image: 'image',
      locations: Locations.fromJson({}),
      token: ''
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'is_active': isActive,
    'country_code': countryCode,
    'phone': phone,
    'full_phone': fullPhone,
    'code': code,
    'image': image,
    'is_profile_completed': isProfileCompleted,
    // 'locations': locations?.toJson(),
    'token': token
  };
}
