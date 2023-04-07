import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../controllers/notification_count_controller.dart';

class NotificationAlertIcon extends GetView<NotificationCountController> {
  const NotificationAlertIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (count) => IconButton(
        onPressed: () => Get.toNamed(Routes.NOTIFICATION_LIST),
        icon: Badge(
          label: Text('$count'),
          child: const Icon(Icons.notifications_outlined),
        ),
      ),
      onEmpty: IconButton(
        onPressed: () => Get.toNamed(Routes.NOTIFICATION_LIST),
        icon: const Icon(Icons.notifications_outlined),
      ),
      onLoading: IconButton(
        onPressed: () => Get.toNamed(Routes.NOTIFICATION_LIST),
        icon: const Icon(Icons.notifications_outlined),
      ),
      onError: (error) => IconButton(
        onPressed: () => Get.toNamed(Routes.NOTIFICATION_LIST),
        icon: const Icon(Icons.notifications_outlined),
      ),
    );
  }
}
