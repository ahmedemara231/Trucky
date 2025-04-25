import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocationModel{
  LatLng latLng;
  String mapDescription;
  String address;


  StoreLocationModel({
    required this.latLng,
    required this.mapDescription,
    required this.address,
  });

  Map<String, dynamic> toJson(){
    return {
      'lat' : latLng.latitude.toString(),
      'lng' : latLng.longitude.toString(),
      'map_desc' : mapDescription,
      'address' : address,
      'description' : address
    };
  }
}