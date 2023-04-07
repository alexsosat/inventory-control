import 'package:get/get.dart';

import '../../../data/models/notifications/notification.dart';
import '../../../data/providers/notification_provider.dart';
import '../../home/controllers/notification_count_controller.dart';

class NotificationListController extends GetxController
    with StateMixin<List<NotificationAlert>> {
  final NotificationProvider _notificationProvider = NotificationProvider();

  @override
  void onInit() {
    loadNotifications();
    super.onInit();
  }

  Future<void> loadNotifications() async {
    change(null, status: RxStatus.loading());
    try {
      final notifications = await _notificationProvider.getAllNotifications();
      if (notifications.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(notifications, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> deleteNotification(int notificationId) async {
    try {
      await _notificationProvider.deleteNotification(notificationId);
      loadNotifications();
      Get.find<NotificationCountController>().loadNotificationsCount();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
