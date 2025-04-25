import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:flutter_base/src/core/navigation/navigator.dart';
import '../../features/place_details/presentation/imports/categories_imports.dart';
import 'package:share_plus/share_plus.dart';

import '../network/api_endpoints.dart';


// class DeepLinkingHelper {
//   static Uri? initialDeepLink;
//   late final AppLinks _appLinks;
//
//   Future<void> init()async {
//     _appLinks = AppLinks();
//     await setupDeepLinkHandler();
//   }
//
//   int ensureProviderIdPlace(Uri uri){
//     late int id;
//     if(uri.path.contains(ApiConstants.offers) || uri.path.contains(ApiConstants.products)){
//       id = int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
//     }else{
//       id = int.parse(uri.pathSegments.last);
//     }
//     return id;
//   }
//
//
//   Future<void> setupDeepLinkHandler() async {
//     _appLinks.uriLinkStream.listen((Uri? uri) {
//       handeDeepLink(uri);
//     });
//   }
//
//
//   handeDeepLink(Uri? uri)async{
//     if (uri != null) {
//       log('Deep link received: $uri');
//       log('path is ${uri.path}');
//       final productId = ensureProviderIdPlace(uri);
//       initialDeepLink = uri;
//       log('offers ${uri.path.contains(ApiConstants.offers)}');
//       log('products ${uri.path.contains(ApiConstants.products)}');
//       if(uri.path.contains(ApiConstants.offers)){
//         Go.to(OffersScreen(providerId: productId));
//       }else if(uri.path.contains(ApiConstants.products)){
//         Go.to(ProductsScreen(providerId: productId));
//       }else{
//         Go.to(PlaceDetails(providerId: productId));
//       }
//     }
//   }
// }



class BuildDynamicLink {
  static final appLinks = AppLinks();

  static int ensureProviderIdPlace(Uri uri){
    late int id;
    if(uri.path.contains(ApiConstants.offers) || uri.path.contains(ApiConstants.products)){
      id = int.parse(uri.pathSegments[uri.pathSegments.length - 2]);
    }else{
      id = int.parse(uri.pathSegments.last);
    }
    return id;
  }

  static handleDeepLink(Uri? uri)async{
    if (uri != null) {
      log('Deep link received: $uri');
      log('path is ${uri.path}');
      final productId = ensureProviderIdPlace(uri);
      log('offers ${uri.path.contains(ApiConstants.offers)}');
      log('products ${uri.path.contains(ApiConstants.products)}');
      if(uri.path.contains(ApiConstants.offers)){
        Go.to(OffersScreen(providerId: productId));
      }else if(uri.path.contains(ApiConstants.products)){
        Go.to(ProductsScreen(providerId: productId));
      }else{
        Go.to(PlaceDetails(providerId: productId));
      }
    }
  }

  static receiveDynamicLinkForTerminated() async {

    final dynamicLinkData = await appLinks.getInitialLink();
    if (dynamicLinkData != null &&
        (dynamicLinkData.scheme == 'https' ||
            dynamicLinkData.scheme == 'http')) {
      log("receiveDynamicLinkForTerminated: ${dynamicLinkData.toString()}");
      log("receiveDynamicLinkForTerminated: ${dynamicLinkData.pathSegments.toString()}");
      log("receiveDynamicLinkForTerminated: ${dynamicLinkData.path.toString()}");

      handleDeepLink(dynamicLinkData);
      // if (dynamicLinkData.pathSegments.firstOrNull == 'product' ) {
      //
      //   int? productId =num.tryParse( dynamicLinkData.pathSegments[1])?.toInt();
      //
      //   if(productId == null) return;
      //   Go.to(ProductsScreen(providerId: productId));
      //
      // }else if (dynamicLinkData.pathSegments.firstOrNull == 'offers' ) {
      //
      //   int? productId =num.tryParse( dynamicLinkData.pathSegments[1])?.toInt();
      //
      //   if(productId == null) return;
      //   Go.to(OffersScreen(providerId: productId));
      // }
      //
      // else{
      //   int? productId =num.tryParse( dynamicLinkData.pathSegments[1])?.toInt();
      //   if(productId == null) return;
      //   Go.to(PlaceDetails(providerId: productId));
      // }
    }
  }


  static receiveDynamicLinkForBackgroundForegroundState() async {
    appLinks.uriLinkStream.listen((dynamicLinkData) {
      log("ForBackgroundForegroundState: ${dynamicLinkData.toString()}");
      if (dynamicLinkData.scheme == 'https' ||
          dynamicLinkData.scheme == 'http') {
        log("ForBackgroundForegroundState Scheme: ${dynamicLinkData.scheme}");
        log("ForBackgroundForegroundState: ${dynamicLinkData.toString()}");
        log("ForBackgroundForegroundState path segments: ${dynamicLinkData.pathSegments.toString()}");
        log("ForBackgroundForegroundState paths: ${dynamicLinkData.path.toString()}");

        handleDeepLink(dynamicLinkData);

        // dynamic id;
        // if (dynamicLinkData.pathSegments.firstOrNull == 'product') {
        //   id = num.tryParse(dynamicLinkData.pathSegments[1])?.toInt();
        //   if (id != null) {
        //     log("product here is: ${dynamicLinkData.pathSegments[1]}");
        //     Go.to(ProductsScreen(providerId: id));
        //   }
        // } else if (dynamicLinkData.pathSegments.firstOrNull == 'offers') {
        //   id = num.tryParse(dynamicLinkData.pathSegments[1])?.toInt();
        //   if (id != null) {
        //     log("offers here is: ${dynamicLinkData.pathSegments[1]}");
        //
        //     Go.to(OffersScreen(providerId: id));
        //   }
        // } else {
        //   id = num.tryParse(dynamicLinkData.pathSegments[1])?.toInt();
        //   if (id != null) {
        //     Go.to(PlaceDetails(providerId: id));
        //   }
        // }

      }
    }).onError((error) {
      log("ForBackgroundForegroundState Error: $error");
    });
  }

  // static Future<String> createDynamicLink() async {
  //   const url = "https://www.daliltijari.com";
  //   await Share.share(url);
  //   log(url);
  //   return url;
  // }

  static Future<String> createDynamicLinkForProductId(
      {required dynamic productId}) async {
    final url = "https://trucky-sa.com/product/$productId";
    await Share.share(url);
    log(url);
    return url;
  }

  static Future<String> createDynamicLinkForOfferId(
      {required dynamic offerId}) async {
    final url = "https://trucky-sa.com/offers/$offerId";
    await Share.share(url);
    log(url);
    return url;
  }
}
