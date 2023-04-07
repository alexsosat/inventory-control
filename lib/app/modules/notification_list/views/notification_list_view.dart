import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_control/app/modules/notification_list/views/widgets/notfication_card.dart';

import '../controllers/notification_list_controller.dart';

class NotificationListView extends GetView<NotificationListController> {
  const NotificationListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        centerTitle: false,
      ),
      body: controller.obx(
        (notifications) => ListView.separated(
          itemCount: notifications!.length,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) =>
              NotificationCard(notifications[index]),
        ),
        onEmpty: const Center(
          child: Text('No hay notificaciones'),
        ),
      ),
    );
  }
}
