part of '../imports/imports.dart';

abstract interface class LangDataSourceInterface{
  Future<void> changeLang();
}

// class LangDataSourceImpl extends LangDataSourceInterface{
//   @override
//   Future<BaseModel<ChangeLangResponse>> changeLang(String newLangCode) async{
//     ChangeLangModel model = ChangeLangModel(
//         newLangCode,
//         NotificationService.deviceToken,
//         Helpers.deviceType,
//         ''
//     );
//
//     final response = await sl<NetworkService>().callApi(
//         NetworkRequest(
//           method: RequestMethod.patch,
//           path: ApiConstants.changeLang,
//           body: model.toJson(),
//         )
//     );
//
//     return response;
//   }
//
// }