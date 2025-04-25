part of '../imports/imports.dart';

abstract class SearchEvents {}

class InitialModel extends SearchEvents{
  final GetProviderModel model;
  InitialModel(this.model);
}

class ExecuteCategoriesSearch extends SearchEvents{
  final FilterProviders filter;
  ExecuteCategoriesSearch(this.filter);
}

class EnterPattern extends SearchEvents{
  FilterProviders inputs;
  EnterPattern(this.inputs);
}

class TapToGetCities extends SearchEvents{
  TapToGetCities();
}

// class OnChange extends SearchEvents{
//   Place place;
//   FilterProviders filterProviders;
//
//   OnChange({
//     required this.place,
//     required this.filterProviders
//   });
// }
