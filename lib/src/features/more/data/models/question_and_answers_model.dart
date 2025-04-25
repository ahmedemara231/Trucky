class QuestionAndAnswersModel{
  String? msg;
  List<QuestionAndAnswer> data;

  QuestionAndAnswersModel({this.msg, required this.data});

  factory QuestionAndAnswersModel.fromJson(Map<String, dynamic> json) => QuestionAndAnswersModel(
      msg: json['msg'],
      data: json['data'].map((e) => QuestionAndAnswer.fromJson(e)).toList()
  );
}

class QuestionAndAnswer{
  int id;
  String question;
  String answers;

  QuestionAndAnswer({required this.id, required this.question, required this.answers});

  factory QuestionAndAnswer.fromJson(Map<String, dynamic> json){
    return QuestionAndAnswer(
      id: json['id'],
      question: json['question'],
      answers: json['answer']
    );
  }

  Map<String, dynamic> toJson() => {
      'id': id,
      'question': question,
      'answer': answers
  };
}