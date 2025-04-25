import 'package:flutter_base/src/core/shared/models/location.dart';

class Providers {
  int id;
  String? name;
  String? image;
  num? rate;
  bool isFavorite;
  List<Locations> locations;

  Providers({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.isFavorite,
    required this.locations
  });


  factory Providers.fromJson(Map<String, dynamic> json) => Providers(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    rate: json['rate_avg'],
    isFavorite: json['is_favored'],
    locations: (json['locations'] as List<dynamic>?)
        ?.map((json) => Locations.fromJson(json as Map<String, dynamic>))
        .toList() ??[],
  );
}