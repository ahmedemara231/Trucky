part of '../imports/imports.dart';

final class OtpState extends Equatable {
  final BaseStatus baseStatus;

  final String msg;
  final UserResponse? model;

  const OtpState({
    required this.baseStatus,
    required this.msg,
    required this.model,
  });

  factory OtpState.initial() {
    return const OtpState(
      baseStatus: BaseStatus.initial,
      msg: '',
      model: null,
    );
  }

  OtpState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    UserResponse? model,
  }) {
    return OtpState(
      baseStatus: baseStatus ?? this.baseStatus,
      msg: msg ?? this.msg,
      model: model?? this.model,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    model,
    msg,
  ];
}
