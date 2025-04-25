class City{
  int? id;
  String? name;
  String? region;
  int? regionId;

  City({
    this.id,
    this.name,
    this.region,
    this.regionId,
  });


  factory City.fromJson(Map<String, dynamic> cityJson) => City(
      id: cityJson['id'],
      name: cityJson['name'],
      region: cityJson['region'],
      regionId: cityJson['region_id']
  );
}