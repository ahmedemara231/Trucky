import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../config/language/locale_keys.g.dart';
import '../../../../core/shared/models/app_categories.dart';
import '../../../../core/shared/models/providers.dart';

class HomeDataModel {
  final LocationDataForHome locationDataForHome;
  final List<Sliders> sliders;
  final List<AppCategories> categories;
  final List<Providers> providers;

  HomeDataModel({
    required this.locationDataForHome,
    required this.sliders,
    required this.categories,
    required this.providers
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    locationDataForHome: LocationDataForHome(
        latLng: LatLng(
            (json['current_location']['lat'] as num).toDouble(),
            (json['current_location']['lng'] as num).toDouble()
        ),
        mapDesc: json['current_location']['map_desc']?? LocaleKeys.pleaseEnterYourLocation
    ),
    sliders: (json['sliders'] as List<dynamic>?)
        ?.map((e) => Sliders.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],

    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => AppCategories.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],

    providers: (json['providers'] as List<dynamic>?)
        ?.map((e) => Providers.fromJson(e as Map<String, dynamic>))
        .toList() ?? [],
  );
}

class Sliders {
  int id;
  String image;
  int? categoryId;

  Sliders({required this.id, required this.image, required this.categoryId});

  factory Sliders.fromJson(Map<String, dynamic> json) => Sliders(
      id: json['id'],
      image: json['image'],
      categoryId: json['category_id']
  );
}

class LocationDataForHome{
  final LatLng latLng;
  final String mapDesc;

  LocationDataForHome({
    required this.latLng,
    required this.mapDesc,
  });
}