class AddRateBody{
  int providerId;
  String ratedModel;
  String rate;
  String comment;


  AddRateBody({
    required this.providerId,
    this.ratedModel = 'providers',
    required this.rate,
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
    'rateable_id': providerId.toString(),
    'rated_model': ratedModel,
    'rate': rate,
    'comment': comment,
  };
}