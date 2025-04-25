class Locations {
  int? id;
  num? lat;
  num? lng;
  String? mapDesc;
  String? address;
  String? description;

  Locations({
    required this.id,
    required this.lat,
    required this.lng,
    required this.mapDesc,
    required this.address,
    required this.description
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    id: json['id'],
    lat: json['lat'],
    lng: json['lng'],
    mapDesc: json['map_desc'],
    address: json['address'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'lat': lat,
    'lng': lng,
    'map_desc': mapDesc,
    'address': address,
    'description': description
  };
}
