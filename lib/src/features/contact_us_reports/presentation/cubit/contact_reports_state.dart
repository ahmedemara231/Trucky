part of '../imports/imports.dart';

final class ContactReportsState extends Equatable {
  final BaseStatus baseStatus;

  final String msg;
  final ReportsResponse? reports;

  const ContactReportsState({
    required this.baseStatus,
    required this.reports,
    required this.msg,
  });

  factory ContactReportsState.initial() {
    return const ContactReportsState(
      baseStatus: BaseStatus.initial,
      reports: null,
      msg: '',
    );
  }

  ContactReportsState copyWith({
    BaseStatus? baseStatus,
    ReportsResponse? reports,
    String? msg,
  }) {
    return ContactReportsState(
      baseStatus: baseStatus ?? this.baseStatus,
      msg: msg ?? this.msg,
      reports: reports?? this.reports,
    );
  }

  @override
  List<Object?> get props => [
    baseStatus,
    reports,
    msg,
  ];
}
