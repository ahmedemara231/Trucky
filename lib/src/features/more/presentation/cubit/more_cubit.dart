part of '../imports/imports.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit(this.repository) : super(MoreState.initial());
  MoreRepository repository;

  void fetchMoreDataFromCache(AboutTermsAndPrivacyModel model){
    emit(state.copyWith(baseStatus: BaseStatus.success, aboutTermsAndPrivacyModel: model));
  }

  void fetchCommonQuestionsFromCache(List<QuestionAndAnswer> qas){
    emit(state.copyWith(baseStatus: BaseStatus.success, commonQuestions: qas));
  }

  Future<void> fetchMoreData(MoreRequest moreRequest)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repository.fetchMoreData(moreRequest);
    result.when((
        success) {
      emit(
        state.copyWith(
            baseStatus: BaseStatus.success,
            aboutTermsAndPrivacyModel: success.data
        ),);
      cacheMoreData(moreRequest, success.data.toJson());
    },
          (error) => emit(
            state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
          ),)
    );
  }

  Future<void> fetchCommonQuestion()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
   final result = await repository.fetchQuestionAndAnswers();
   result.when(
           (success) {
             emit(
                 state.copyWith(
                     baseStatus: BaseStatus.success,
                     commonQuestions: success.data.data
                 ));
             cacheCommonQuestions(success.data.data);
           },
       (error) => emit(
           state.copyWith(
               baseStatus: BaseStatus.success,
               msg: error.message
           )),
   );
  }

  Future<void> changeNotify()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repository.changeNotify();
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              notify: success.data,
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message,
          )),
    );
  }

  Future<void> changeLang(Languages newLang)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repository.changeLang(
        ChangeLangBody(language: newLang.languageCode)
    );
    result.when(
          (success) => emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.data,
          )),
          (error) => emit(
          state.copyWith(
            baseStatus: BaseStatus.success,
            msg: error.message,
          )),
    );
  }
}

Future<void> cacheMoreData(MoreRequest request, dynamic value)async{
  log('cache more data');
  await CacheStorage.write(request.name, jsonEncode(value));
}

Future<void> cacheCommonQuestions(List<QuestionAndAnswer>? commonQuestions)async{
  final List<Map<String, dynamic>> qas = commonQuestions!.map((e) => e.toJson(),).toList();
  await CacheStorage.write(CacheConstants.commonQuestions, jsonEncode(qas));
}