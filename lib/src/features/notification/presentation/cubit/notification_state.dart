import 'package:equatable/equatable.dart';

import '../../../../core/shared/base_state.dart';
import '../../data/models/notification_model.dart';

final class NotificationState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final List<NotificationModel>? notifications;
  final int? notificationCount;

  const NotificationState({
    required this.baseStatus,
    this.msg = '',
    this.notificationCount,
    this.notifications
  });

  factory NotificationState.initial() => const NotificationState(
    baseStatus: BaseStatus.initial,
    notifications: [],
    notificationCount: 0
  );

  NotificationState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    int? notificationCount,
    List<NotificationModel>? notifications
  }) =>  NotificationState(
    notificationCount: notificationCount?? this.notificationCount,
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    notifications: notifications?? this.notifications
  );

  @override
  List<Object?> get props => [
    baseStatus,
    notifications,
    notificationCount,
    msg,
  ];
}
