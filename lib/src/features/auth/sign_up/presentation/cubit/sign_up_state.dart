import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/features/auth/sign_up/data/models/register_response.dart';
import '../../../../../core/shared/base_state.dart';

final class SignUpState extends Equatable {
  final BaseStatus baseStatus;

  final String msg;
  final RegisterResponse? model;

  const SignUpState({
    required this.baseStatus,
    required this.msg,
    required this.model
  });

  factory SignUpState.initial() {
    return const SignUpState(
      baseStatus: BaseStatus.initial,
      msg: '',
      model: null,
    );
  }

  SignUpState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    RegisterResponse? model,
  }) {
    return SignUpState(
      baseStatus: baseStatus ?? this.baseStatus,
      msg: msg ?? this.msg,
      model: model?? this.model,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    msg,
    model,
  ];
}
