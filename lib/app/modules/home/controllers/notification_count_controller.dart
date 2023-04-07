import 'package:get/get.dart';
import '../../../data/providers/notification_provider.dart';

class NotificationCountController extends GetxController with StateMixin<int> {
  final NotificationProvider _notificationProvider = NotificationProvider();

  Future<void> loadNotificationsCount() async {
    change(null, status: RxStatus.loading());
    try {
      final notifications = await _notificationProvider.getNotificationCount();
      if (notifications == 0) {
        change(null, status: RxStatus.empty());
      } else {
        change(notifications, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
