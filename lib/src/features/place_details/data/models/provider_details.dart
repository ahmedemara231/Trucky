import 'package:flutter_base/src/features/place_details/data/models/offers.dart';
import 'package:flutter_base/src/features/place_details/data/models/products.dart';
import '../../../../core/shared/models/app_categories.dart';
import '../../../../core/shared/models/location.dart';

class ProviderDetails{
  String msg;
  ProviderDetailsModel model;

  ProviderDetails({
    required this.msg,
    required this.model,
  });

  factory ProviderDetails.fromJson(Map<String, dynamic> jsonData) => ProviderDetails(
    msg: jsonData['msg'],
    model: ProviderDetailsModel.fromJson(jsonData['data']),
  );
}

class ProviderDetailsModel{
  int id;
  String image;
  String name;
  int phone;
  int countryCode;
  int fullPhone;
  String? storeMobile;
  String? storeWhatsapp;
  String? description;
  String? statusTitle;
  num rateAvg;
  bool isAvailable;
  String isAvailableText;
  bool isFavored;
  bool isRated;
  List<WorkTime> workTimes;
  bool checkStatus;
  List<Locations> location;
  List<AppCategories> categories;

  List<Social> socials;
  List<Products> products;
  List<Offers> offers;
  Info? info;
  Rates? rates;

  ProviderDetailsModel({
    required this.id,
    required this.image,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.fullPhone,
     this.storeMobile,
     this.storeWhatsapp,
    required this.checkStatus,
    required this.description,
    required this.statusTitle,
    required this.rateAvg,
    required this.isAvailable,
    required this.isAvailableText,
    required this.isFavored,
    required this.isRated,
    required this.workTimes,
    required this.location,
    required this.socials,
    required this.categories,
    required this.products,
    required this.offers,
     this.info,
    required this.rates,
  });

  factory ProviderDetailsModel.initial(){
    return ProviderDetailsModel(
      id: 0,
      image: '',
      name: '',
      phone: 0,
      countryCode: 0,
      checkStatus: false,
      fullPhone: 0,
      description: '',
      statusTitle: '',
      rateAvg: 0.0,
      isAvailable: false,
      isAvailableText: '',
      isFavored: false,
      isRated: false,
      workTimes: [],
      location: [],
      socials: [],
      categories: [],
      products: [],
      offers: [],
      rates: Rates(quality: []),
    );
  }

  ProviderDetailsModel copyWith({
    int? id,
    image,
    name,
    int? phone,
    int? countryCode,
    int? fullPhone,
    String? description,
    String? statusTitle,
    num? rateAvg,
    bool? isAvailable,
    String? isAvailableText,
    bool? isFavored,
    bool? isRated,
    List<WorkTime>? workTimes,
    List<Locations>? location,
    List<Social>? socials,
    List<AppCategories>? categories,
    List<Products>? products,
    bool? checkStatus,
    List<Offers>? offers,
    List<Info>? info,
    Rates? rates,
  }) {
    return ProviderDetailsModel(
      id: id?? this.id,
      image: image?? this.image,
      checkStatus: checkStatus?? this.checkStatus,
      name: name?? this.name,
      phone: phone?? this.phone,
      countryCode: countryCode?? this.countryCode,
      fullPhone: fullPhone?? this.fullPhone,
      storeMobile: storeMobile,
      storeWhatsapp:storeWhatsapp,
      description: description?? this.description,
      statusTitle: statusTitle?? this.statusTitle,
      rateAvg: rateAvg?? this.rateAvg,
      isAvailable: isAvailable?? this.isAvailable,
      isAvailableText: isAvailableText?? this.isAvailableText,
      isFavored: isFavored?? this.isFavored,
      isRated: isRated?? this.isRated,
      workTimes: workTimes?? this.workTimes,
      location: location?? this.location,
      socials: socials?? this.socials,
      categories: categories?? this.categories,
      products: products?? this.products,
      offers: offers?? this.offers,
      info: this.info,
      rates: rates?? this.rates,
    );
}


  factory ProviderDetailsModel.fromJson(Map<String, dynamic> jsonData) => ProviderDetailsModel(
    id: jsonData['id'],
    image: jsonData['image'],
    checkStatus: jsonData['is_checked_in'],
    name: jsonData['name'],
    phone: jsonData['phone'],
    countryCode: jsonData['country_code'],
    fullPhone: jsonData['full_phone'],
    storeMobile: jsonData['store_mobile'],
    storeWhatsapp: jsonData['store_whatsapp'],
    description: jsonData['description'],
    statusTitle: jsonData['status_title']['value'],
    rateAvg: jsonData['rate_avg'],
    isAvailable: jsonData['is_available'],
    isAvailableText: jsonData['is_available_text'],
    isFavored: jsonData['is_favored'],
    isRated: jsonData['is_rated'],
    location: (jsonData['locations'] as List)
        .map((e) => Locations.fromJson(e as Map<String, dynamic>))
        .toList(),
    workTimes: (jsonData['work_times'] as List)
        .map((e) => WorkTime.fromJson(e as Map<String, dynamic>))
        .toList(),
    categories: (jsonData['categories'] as List)
        .map((e) => AppCategories.fromJson(e as Map<String, dynamic>))
        .toList(),
    socials: (jsonData['socials'] as List)
        .map((e) => Social.fromJson(e as Map<String, dynamic>))
        .toList(),
    products: (jsonData['products'] as List)
        .map((e) => Products.fromJson(e as Map<String, dynamic>))
        .toList(),
    offers: (jsonData['offers'] as List)
        .map((e) => Offers.fromJson(e as Map<String, dynamic>))
        .toList(),
    // info: Info.fromJson(jsonData['info']),
    info: jsonData["info"] == null ? null : Info.fromJson(jsonData["info"]),
    // info: (jsonData['info'] as List)
    //     .map((e) => Info.fromJson(e as Map<String, dynamic>))
    //     .toList(),
    rates: null,
    // rates: (jsonData['rates'] as List).map((e) => Rates.fromJson(jsonData['rates'],).toList(),
  );
}

class WorkTime {
  String day;
  String startTime;
  String endTime;
  int isOffDay;

  WorkTime({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.isOffDay,
  });


  factory WorkTime.fromJson(Map<String, dynamic> jsonData) => WorkTime(
    day: jsonData['day'],
    startTime: jsonData['start_time'],
    endTime: jsonData['end_time'],
    isOffDay: jsonData['is_off_day'],
  );

}

class Social{
  String name;
  String title;
  String value;

  Social({
    required this.name,
    required this.title,
    required this.value,
  });

  factory Social.fromJson(Map<String, dynamic> socialData) => Social(
    name: socialData['name'],
    title: socialData['title'],
    value: socialData['value'],
  );
}

class Info{
  int id;
  String? notes;
  String? about;
  String? description;

  Info({
    required this.id,
    required this.notes,
    required this.about,
    required this.description,
  });

  factory Info.fromJson(Map<String, dynamic> jsonData) => Info(
    id: jsonData['id'],
    notes: jsonData['notes'],
    about: jsonData['about'],
    description: jsonData['description']
  );
}

class Rates{
  List<Quality> quality;

  Rates({
    required this.quality,
  });

  factory Rates.fromJson(Map<String, dynamic> jsonData) => Rates(
    quality: (jsonData['quality'] as List)
       .map((e) => Quality.fromJson(e as Map<String, dynamic>))
       .toList(),
  );
}


class Quality{
  User user;
  String comment;
  int rate;
  String type;

  Quality({
    required this.user,
    required this.comment,
    required this.rate,
    required this.type,
  });

  factory Quality.fromJson(Map<String, dynamic> jsonData) => Quality(
    user: User.fromJson(jsonData['user']),
    comment: jsonData['comment'],
    rate: jsonData['rate'],
    type: jsonData['type'],
  );
}


class User{
  int id;
  String name;
  String image;

  User({
    required this.id,
    required this.name,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) => User(
    id: jsonData['id'],
    name: jsonData['name'],
    image: jsonData['image'],
  );
}