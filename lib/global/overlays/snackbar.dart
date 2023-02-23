import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';

/// Shows a bottom snackbar with the [title] and [message]
snackbarMessage({
  String? title,
  String? message,
  Duration duration = const Duration(seconds: 3),
}) {
  Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      borderRadius: 15,
      backgroundColor: Get.theme.cardColor,
      duration: const Duration(seconds: 3),
      titleText: Text(
        title ?? "",
        style: Get.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white : Get.theme.colorScheme.error,
        ),
      ),
      messageText: Text(
        message ?? "",
        style: Get.textTheme.bodyLarge?.copyWith(
          color: Get.isDarkMode ? Colors.white : Get.theme.colorScheme.error,
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.grey[800]!.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
  );
}
