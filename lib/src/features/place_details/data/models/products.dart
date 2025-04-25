import 'package:flutter_base/src/core/shared/models/pagination.dart';

class ProductsResponse{
  List<Products> products;
  AppPagination pagination;

  ProductsResponse({
    required this.products,
    required this.pagination,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> productsJson) => ProductsResponse(
    products: (productsJson['data'] as List)
        .map((e) => Products.fromJson(e))
        .toList(),
    pagination: AppPagination.fromJson(productsJson['pagination']),
  );
}

class Products{
  int id;
  String imageUrl;
  int price;
  ProductTranslations translation;

  Products({required this.id, required this.imageUrl, required this.price, required this.translation});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json['id'],
    imageUrl: json['image'],
    price: json['price'],
    translation: ProductTranslations.fromJson(json['translations'])
  );
}

class ProductTranslations {
  String name;
  String description;

  ProductTranslations({required this.name, required this.description});

  factory ProductTranslations.fromJson(Map<String, dynamic> json) => ProductTranslations(
    name: json['name'],
    description: json['description'],
  );
}