part of '../imports/imports.dart';


final class ProfileState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final UserData? profileModel;
  final UserData? userData;

  const ProfileState({
    required this.baseStatus,
    this.profileModel,
    this.userData,
    this.msg = ConstantManager.emptyText,
  });

  factory ProfileState.initial() {
    return const ProfileState(
      baseStatus: BaseStatus.initial,
      profileModel: null,
      userData: null,
    );
  }

  ProfileState copyWith({
    BaseStatus? baseStatus,
    UserData? profileModel,
    UserData? userData,
    bool? notify,
    String? msg,
  }) {
    return ProfileState(
      msg: msg?? this.msg,
      userData: userData?? this.userData,
      profileModel: profileModel?? this.profileModel,
      baseStatus: baseStatus ?? this.baseStatus,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    profileModel,
    userData,
    msg,
  ];
}

