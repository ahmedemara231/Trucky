class ProductDetailsModel{
  String? imageUrl;
  String? name;
  String? subTitle;
  String? redTitle;
  double? price;
  String? link;

  // TODO: other data like location for example

  ProductDetailsModel({
    this.imageUrl,
    this.name,
    this.subTitle,
    this.redTitle,
    this.price,
    this.link
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json){ // TODO: edit keys
    return ProductDetailsModel(
      imageUrl: json['image_url'],
      name: json['name'],
      subTitle: json['sub_title'],
      redTitle: json['red_title'],
      price: json['price'],
      link: json['link'],
    );
  }
}