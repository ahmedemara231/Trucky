part of 'notification_service.dart';

class NotificationRoutes {
  static void navigateByType(Map<String, dynamic> data) {
    final int id = data['id'];
    final notificationType = id.type;
    notificationType.navigation.navigate(data: data);
  }
}

extension GetNotificationTypeById on int {
  NotificationType get type {
    return NotificationType.values.firstWhere((element) => element.id == this);
  }
}

abstract interface class NotificationNavigation {
  void navigate({required Map<String, dynamic> data});
}

class HomeNavigation implements NotificationNavigation {
  const HomeNavigation();
  @override
  void navigate({required Map<String, dynamic> data}) {
    Go.offAll(const AppBottomBar());
  }
}

class MessageNavigation implements NotificationNavigation {
  const MessageNavigation();
  @override
  void navigate({required Map<String, dynamic> data}) {
    // Navigate to message screen with logic
  }
}

class UpdateNavigation implements NotificationNavigation {
  const UpdateNavigation();
  @override
  void navigate({required Map<String, dynamic> data}) {
    // Navigate to update screen
  }
}

// class AdminNotify implements NotificationNavigation {
//   const AdminNotify();
//   @override
//   void navigate({required Map<String, dynamic> data}) {
//     Go.to(const Profile());
//   }
// }