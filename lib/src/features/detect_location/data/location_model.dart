class LocationModel{
  String? countryName;
  String? street;
  String? isoCountryCode;
  String? postalCode;
  String? administrativeArea;
  String? subAdministrativeArea;
  String? locality;
  String? subLocality;
  String? thoroughfare;
  String? subThoroughfare;

  LocationModel({
    this.countryName,
    this.street,
    this.isoCountryCode,
    this.postalCode,
    this.administrativeArea,
    this.subAdministrativeArea,
    this.locality,
    this.subLocality,
    this.thoroughfare,
    this.subThoroughfare
  });

  factory LocationModel.fromJson(Map<String, dynamic> json){
    return LocationModel(
      countryName: json['name'],
      street: json['street'],
      isoCountryCode: json['isoCountryCode'],
      postalCode: json['postalCode'],
      administrativeArea: json['administrativeArea'],
      subAdministrativeArea: json['subAdministrativeArea'],
      locality: json['locality'],
      subLocality: json['subLocality'],
      thoroughfare: json['thoroughfare'],
      subThoroughfare: json['subThoroughfare'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': countryName,
    'street': street,
    'isoCountryCode': isoCountryCode,
    'postalCode': postalCode,
    'administrativeArea': administrativeArea,
    'subAdministrativeArea': subAdministrativeArea,
    'locality': locality,
    'subLocality': subLocality,
    'thoroughfare': thoroughfare,
    'subThoroughfare': subThoroughfare,
  };
}