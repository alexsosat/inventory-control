import 'package:isar/isar.dart';

import '../models/notifications/notification.dart';

class NotificationProvider {
  late Isar isar;

  NotificationProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get notification count.
  Future<int> getNotificationCount() async =>
      await isar.notificationAlerts.where().count();

  /// Get all the notifications.
  Future<List<NotificationAlert>> getAllNotifications() async =>
      await isar.notificationAlerts.where().findAll();

  /// Add a notification to the database.
  /// Args:
  /// notification (NotificationAlert): The notification to be added
  Future<int> createNotification(NotificationAlert notification) async =>
      isar.writeTxn(() async {
        return await isar.notificationAlerts.put(notification);
      });

  /// Delete a notification from the database.
  /// Args:
  /// notificationId (int): The id of the notification to be deleted
  Future<void> deleteNotification(int notificationId) async =>
      isar.writeTxn(() async {
        await isar.notificationAlerts.delete(notificationId);
      });
}
