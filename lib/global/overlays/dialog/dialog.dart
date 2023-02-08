import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'widgets/dialog_widget.dart';

export 'widgets/dialog_widget.dart';

/// Opens a confirmation dialog with a [title] and a [message]
/// inside the application.
///
/// The actions of the button are set in the [onCancel] and [onConfirm] parameters
Future openDialogWindow({
  required String title,
  String? message,
  required DialogType type,
  Function()? onCancel,
  Function()? onConfirm,
  bool barrierDismissible = true,
  bool buttonDismissible = true,
}) async {
  Get.dialog(
    ScaffoldMessenger(
      child: Builder(
        builder: (context) => DialogWidget(
          barrierDismissible: barrierDismissible,
          buttonDismissible: buttonDismissible,
          title: title,
          type: type,
          message: message,
          onCancel: onCancel,
          onConfirm: onConfirm,
        ),
      ),
    ),
  );
}

displayErrorDialog(
  String message, {
  Function()? onConfirm,
}) {
  openDialogWindow(
    title: "Ha ocurrido un error",
    message: message,
    type: DialogType.error,
    onConfirm: () => onConfirm?.call(),
  );
}
