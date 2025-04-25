class OnBoardingResponse{
  List<OnBoardingModel> models;
  OnBoardingResponse({required this.models});

  factory OnBoardingResponse.fromJson(Map<String, dynamic> json) => OnBoardingResponse(
    models: (json['data'] as List)
        .map((e) => OnBoardingModel.fromJson(e as Map<String, dynamic>))
        .toList()
  );
}

class OnBoardingModel {
  final String title;
  final String description;
  final String image;

  OnBoardingModel({required this.title, required this.description, required this.image});

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) => OnBoardingModel(
    title: json['title'],
    description: json['description'],
    image: json['image'],
  );
}