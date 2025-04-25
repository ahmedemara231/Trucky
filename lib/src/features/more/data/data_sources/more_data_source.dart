part of '../imports/data_imports.dart';

enum MoreRequest{about, terms, privacy, howTruckyWorks}

abstract class MoreDataSource {
  Future<BaseModel<AboutTermsAndPrivacyModel>> fetchMoreData(MoreRequest moreRequest);
  Future<BaseModel<QuestionAndAnswersModel>> fetchQuestionAndAnswers();
  Future<BaseModel<bool>> changeNotify();
  Future<BaseModel<String>> changeLang(ChangeLangBody changeLangBody);
}

String moreEndPoint(MoreRequest moreRequest) {
  switch(moreRequest){
    case MoreRequest.about:
      return ApiConstants.about;

    case MoreRequest.terms:
      return ApiConstants.terms;

    case MoreRequest.privacy:
      return ApiConstants.privacy;

    case MoreRequest.howTruckyWorks:
      return ApiConstants.privacy;
  }
}

class MoreDataSourceImpl implements MoreDataSource {
  @override
  Future<BaseModel<AboutTermsAndPrivacyModel>> fetchMoreData(MoreRequest moreRequest)async {
    final BaseModel<AboutTermsAndPrivacyModel> model = await sl<NetworkService>().callApi<AboutTermsAndPrivacyModel>(
      NetworkRequest(
            method: RequestMethod.get,
            headers: {
              'Content-Type': 'application/json',
            },
            path: moreEndPoint(moreRequest),
        ),
      mapper: (json) => AboutTermsAndPrivacyModel.fromJson(json),
    );

    return model;
  }

  @override
  Future<BaseModel<QuestionAndAnswersModel>> fetchQuestionAndAnswers()async {
    List<QuestionAndAnswer> commonQuestions= [];
    late QuestionAndAnswersModel model;
    final BaseModel<QuestionAndAnswersModel> result = await sl<NetworkService>().callApi(
        NetworkRequest(
            method: RequestMethod.get,
            path: ApiConstants.questionsAnswers,
        ),
      mapper: (json) {
          for(Map<String, dynamic> element in (json['data'] as List)){
            commonQuestions.add(QuestionAndAnswer.fromJson(element));
          }
          model = QuestionAndAnswersModel(data: commonQuestions);
          return model;
      }
    );

    return result;
  }

  @override
  Future<BaseModel<bool>> changeNotify() async{
    final result = await sl<NetworkService>().callApi<bool>(
      NetworkRequest(
        method: RequestMethod.patch,
        path: ApiConstants.switchNotify,
      ),
      mapper: (json) => json['data']['notify']
    );
    return result;
  }

  @override
  Future<BaseModel<String>> changeLang(ChangeLangBody changeLangBody) async{
    final result = await sl<NetworkService>().callApi<String>(
        NetworkRequest(
          method: RequestMethod.patch,
          path: ApiConstants.changeLang,
          body: changeLangBody.toJson()
        ),
        mapper: (json) => json['msg']
    );
    return result;
  }
}