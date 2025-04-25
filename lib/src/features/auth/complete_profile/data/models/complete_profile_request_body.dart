import 'dart:io';

class CompleteProfileRequest{
  RequestBody? body;
  RequestHeaders? headers;

  CompleteProfileRequest({this.body, this.headers});
}

class RequestBody{
  String? name;
  File? image;

  RequestBody({this.name, this.image});

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image,
  };
}

class RequestHeaders{
  String? authorizationToken;

  // RequestHeaders({this.acceptLanguageCode, this.authorizationToken});

  Map<String, dynamic> toJson() => {
    HttpHeaders.authorizationHeader: authorizationToken,
  };
}