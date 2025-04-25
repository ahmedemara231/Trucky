class AppCategories {
  int id;
  String name;
  String image;

  AppCategories({required this.id, required this.name, required this.image});

  factory AppCategories.fromJson(Map<String, dynamic> json) => AppCategories(
      id: json['id'],
      name: json['name'],
      image: json['image']??''
  );
}