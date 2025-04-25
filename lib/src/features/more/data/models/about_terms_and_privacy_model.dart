class AboutTermsAndPrivacyModel{
  String msg;
  String data;

  AboutTermsAndPrivacyModel({required this.msg, required this.data});

  factory AboutTermsAndPrivacyModel.fromJson(Map<String, dynamic> json) => AboutTermsAndPrivacyModel(
    msg: json['msg'],
    data: json['data'],
  );

  Map<String, dynamic> toJson() => {
    'msg': msg,
    'data': data,
  };
}