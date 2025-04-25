class CheckResponse{
  final String msg;
  bool status;

  CheckResponse({
    required this.msg,
    required this.status,
  });


  factory CheckResponse.fromJson(Map<String, dynamic> json){
    return CheckResponse(
      msg: json['msg'],
      status: json['data']['status'],
    );
  }
}