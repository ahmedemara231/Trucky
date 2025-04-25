import 'package:flutter_base/src/core/shared/models/pagination.dart';

class OffersResponse{
  List<Offers> offers;
  AppPagination pagination;

  OffersResponse({
    required this.offers,
    required this.pagination
  });
  
  factory OffersResponse.fromJson(Map<String, dynamic> offersJson) => OffersResponse(
      offers: (offersJson['data'] as List)
          .map((e) => Offers.fromJson(e))
          .toList(),
      pagination: AppPagination.fromJson(offersJson['pagination'])
  );
}

class Offers{
  final num price;
  final int id;
  final String images;
  final OffersTranslations offersTranslations;

  Offers({
    required this.id,
    required this.images,
    required this.offersTranslations,
    required this.price,
  });

  factory Offers.fromJson(Map<String, dynamic> jsonData) => Offers(
    price: jsonData['price'],
    id: jsonData['id'],
    images: jsonData['images']['file'],
    offersTranslations: OffersTranslations.fromJson(jsonData['translations']),
  );
}

class OffersTranslations{
  String? title;
  String? description;
  String? periodTitle;

  OffersTranslations({
    required this.title,
    required this.description,
    required this.periodTitle,
  });

  factory OffersTranslations.fromJson(Map<String, dynamic> jsonData) => OffersTranslations(
    title: jsonData['title'],
    description: jsonData['description'],
    periodTitle: jsonData['period_title'],
  );
}