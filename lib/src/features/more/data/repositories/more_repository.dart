part of '../imports/data_imports.dart';

abstract class MoreRepository {
  Future<Result<BaseModel<AboutTermsAndPrivacyModel>, Failure>> fetchMoreData(MoreRequest moreRequest);
  Future<Result<BaseModel<QuestionAndAnswersModel>, Failure>> fetchQuestionAndAnswers();
  Future<Result<BaseModel<bool>, Failure>> changeNotify();
  Future<Result<BaseModel<String>, Failure>> changeLang(ChangeLangBody body);
}

class MoreRepositoryImpl implements MoreRepository {
  final MoreDataSource moreDataSource;

  MoreRepositoryImpl({
    required this.moreDataSource,
  });

  @override
  Future<Result<BaseModel<AboutTermsAndPrivacyModel>, Failure>> fetchMoreData(MoreRequest moreRequest) {
    return moreDataSource
        .fetchMoreData(moreRequest)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<QuestionAndAnswersModel>, Failure>> fetchQuestionAndAnswers() {
    return moreDataSource
        .fetchQuestionAndAnswers()
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<bool>, Failure>> changeNotify() async{
    return await moreDataSource.changeNotify().handleCallbackWithFailure();
  }

  @override
  Future<Result<BaseModel<String>, Failure>> changeLang(ChangeLangBody body) async{
    return await moreDataSource.changeLang(body).handleCallbackWithFailure();
  }
}