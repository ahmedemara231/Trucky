part of '../imports/imports.dart';

final class CompleteProfileState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final UserResponse? user;

  const CompleteProfileState({
    required this.baseStatus,
    required this.user,
    this.msg = ConstantManager.emptyText,
  });

  factory CompleteProfileState.initial() {
    return const CompleteProfileState(
      baseStatus: BaseStatus.initial,
      user: null
    );
  }

  CompleteProfileState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    UserResponse? user,
  }) {
    return CompleteProfileState(
      baseStatus: baseStatus ?? this.baseStatus,
      msg: msg ?? this.msg,
      user: user?? this.user,
    );
  }

  @override
  List<Object> get props => [
    baseStatus,
    msg,
  ];
}
