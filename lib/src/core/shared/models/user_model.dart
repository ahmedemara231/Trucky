class UserModel {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String city;
  final int userType;
  final bool allowNotify;
  final String? token;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.city,
    required this.userType,
    required this.allowNotify,
    required this.token,
  });

  factory UserModel.initial() => UserModel(
        id: '',
        fullName: '',
        phoneNumber: '',
        email: '',
        city: '',
        userType: 0,
        allowNotify: false,
        token: '',
      );

  UserModel copyWith({
    String? id,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? city,
    int? userType,
    bool? allowNotify,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      city: city ?? this.city,
      userType: userType ?? this.userType,
      allowNotify: allowNotify ?? this.allowNotify,
      token: token ?? this.token,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        city: json["city"],
        userType: json["userType"],
        allowNotify: json["allowNotify"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
        "city": city,
        "userType": userType,
        "allowNotify": allowNotify,
      };
}
