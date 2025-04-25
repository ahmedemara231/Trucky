import 'package:flutter_base/src/core/shared/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/imports/imports.dart';
import '../../data/models/notification_model.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repo) : super(NotificationState.initial());

  NotificationRepo repo;
  Future<void> getNotifications(int currentPage)async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getNotifications(currentPage);
    result.when(
          (success) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  notifications: success.data.notifications
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  msg: error.message
              )),
    );
  }

  Future<void> deleteSingleNotification(String notificationId)async{
    deleteLocally(notificationId);
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.deleteSingleNotification(notificationId);
    result.when(
          (success) => emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.data
          )),
          (error) => emit(
              state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
              )),
    );
  }

  void deleteLocally(String notificationId){
    List<NotificationModel>? notifications = List.from(state.notifications!);
    notifications.removeWhere((element) => element.id == notificationId);
    emit(state.copyWith(notifications: notifications));
  }

  Future<void> deleteAllNotifications()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.deleteAllNotifications();
    result.when(
          (success) => emit(
              state.copyWith(
                baseStatus: BaseStatus.success,
                msg: success.data
              )),
          (error) => emit(
              state.copyWith(
                  baseStatus: BaseStatus.success,
                  msg: error.message
              )),
    );
  }

  Future<void> getNotificationCount()async{
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await repo.getNotificationsNumber();
    result.when(
          (success) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              notificationCount: success.data
          )),
          (error) => emit(
          state.copyWith(
              baseStatus: BaseStatus.success,
              msg: error.message
          )),
    );
  }

  Future<void> resetNotificationCount()async{
    emit(state.copyWith(notificationCount: 0));
  }
}