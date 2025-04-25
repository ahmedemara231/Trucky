part of '../imports/imports.dart';

class CommonQuestion extends StatelessWidget {
  const CommonQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helpers.setScaffoldBackgroundColor(AppBackgroundColors.mintGreen),
      appBar: CustomAppBar(
        title: AppText(
          LocaleKeys.commonQuestions, fontWeight: FontWeight.bold,),
      ),
      body: const _CommonQuestionsBody(),
    );
  }
}

class _CommonQuestionsBody extends StatefulWidget {
  const _CommonQuestionsBody({super.key});

  @override
  State<_CommonQuestionsBody> createState() => _CommonQuestionsBodyState();
}

class _CommonQuestionsBodyState extends State<_CommonQuestionsBody> {

  void get _getQsFromCache {
    List qasAsString = jsonDecode(CacheStorage.read(CacheConstants.commonQuestions));
    List<QuestionAndAnswer> qasAsObj = qasAsString
        .map((e) => QuestionAndAnswer.fromJson(e as Map<String, dynamic>))
        .toList();

    context.read<MoreCubit>().fetchCommonQuestionsFromCache(qasAsObj);
  }

  Future<void> get _getQsRemoteData async{
    await context.read<MoreCubit>().fetchCommonQuestion();
  }

  Future<void> get _getCommonQuestions async{
    try {
      _getQsFromCache;
    } catch (e) {
      _getQsRemoteData;
    }
  }

  @override
  void initState() {
    _getCommonQuestions;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(
      builder: (context, state) {
        return AppRefreshIndicator(
          onRefresh: () => _getQsRemoteData,
          child: StatusBuilder(
            status: state.baseStatus,
            placeHolder: '  ',
            builder: (placeHolder, isLoading) => isLoading? CustomLoading.showLoadingView() :
            ListView(
              children: List.generate(
                  state.commonQuestions!.length,
                      (index) =>
                      CustomizedQuestionAndAnswerWidget(questionAndAnswer: state.commonQuestions?[index])
                // QuestionAndAnswerWidget(
                //   question: state.commonQuestions?[index].question ?? '',
                //   answer: state.commonQuestions?[index].answers ?? '',
                // ),
              ),
            ).defaultAppScreenPadding(),
          ),
        );
      },
    );
  }
}