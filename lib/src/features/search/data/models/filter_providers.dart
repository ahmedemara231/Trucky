class FilterProviders{
  final String? name;
  final int? category;
  final bool? isAvailable;
  final bool? topRated;
  final bool? leastRated;
  final bool? mostNear;
  final int? city;

  const FilterProviders({
    this.name,
    this.category,
    this.isAvailable,
    this.topRated = true,
    this.leastRated,
    this.mostNear = true,
    this.city,
  });

  FilterProviders copyWith({
    String? name,
    int? category,
    bool? isAvailable,
    bool? topRated,
    bool? leastRated,
    bool? mostNear,
    int? city,
  }){
    return FilterProviders(
      name: name?? this.name,
      topRated: topRated?? this.topRated,
      mostNear: mostNear?? this.mostNear,
      city: city?? this.city,
      category: category?? this.category,
      isAvailable: isAvailable?? this.isAvailable,
      leastRated: leastRated?? this.leastRated,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'category': category,
    'is_available': isAvailable,
    'top_rated': topRated,
    'least_rated': leastRated,
    'most_near': mostNear,
    'city_id' : city
  };
}