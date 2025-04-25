class ChangeLangModel{
  String newLangCode;
  String deviceId;
  String deviceType;
  String macAddress;

  ChangeLangModel(this.newLangCode, this.deviceId, this.deviceType, this.macAddress);

  Map<String, dynamic> toJson(){
    return {
      'lang': newLangCode,
      'device_id': deviceId,
      'device_type': deviceType,
      'mac_address': macAddress
    };
  }

}