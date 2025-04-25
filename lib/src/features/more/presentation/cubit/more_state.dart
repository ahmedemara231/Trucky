part of '../imports/imports.dart';


final class MoreState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final List<dynamic>? commonQuestions;
  final bool notify;

  final AboutTermsAndPrivacyModel? aboutTermsAndPrivacyModel;


  const MoreState({
    required this.baseStatus,
    required this.commonQuestions,
    required this.aboutTermsAndPrivacyModel,
    this.notify = false,
    this.msg = ConstantManager.emptyText,
  });

  factory MoreState.initial() {
    return const MoreState(
      baseStatus: BaseStatus.initial,
      commonQuestions: [],
      aboutTermsAndPrivacyModel: null
    );
  }

  MoreState copyWith({
    BaseStatus? baseStatus,
    List<QuestionAndAnswer>? commonQuestions,
    bool? notify,
    String? msg,
    AboutTermsAndPrivacyModel? aboutTermsAndPrivacyModel,
  }) {
    return MoreState(
      msg: msg?? this.msg,
      notify: notify?? this.notify,
      baseStatus: baseStatus ?? this.baseStatus,
      commonQuestions: commonQuestions?? this.commonQuestions,
      aboutTermsAndPrivacyModel: aboutTermsAndPrivacyModel?? this.aboutTermsAndPrivacyModel,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    commonQuestions,
    msg,
    aboutTermsAndPrivacyModel,
  ];
}
