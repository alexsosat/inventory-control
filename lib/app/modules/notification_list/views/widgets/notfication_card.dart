import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notification_list_controller.dart';
import '../../../../../global/overlays/dialog/dialog.dart';
import '../../../../data/models/notifications/notification.dart';

class NotificationCard extends StatelessWidget {
  final NotificationAlert notification;

  const NotificationCard(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.notifications),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    notification.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    openDialogWindow(
                      title: "¿Deseas eliminar esta notificación?",
                      message: "Esta acción no se puede deshacer",
                      type: DialogType.warning,
                      onConfirm: () => Get.find<NotificationListController>()
                          .deleteNotification(notification.id),
                      onCancel: () {},
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                )
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            Text(notification.body),
          ],
        ),
      ),
    );
  }
}
