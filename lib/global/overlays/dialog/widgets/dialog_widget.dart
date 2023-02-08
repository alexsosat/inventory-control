import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../gen/assets.gen.dart';

import '../../../buttons/pill_button.dart';
import 'vertical_stack.dart';

enum DialogType {
  success,
  info,
  error,
  warning,
}

class DialogWidget extends StatelessWidget {
  final String title;
  final String? message;
  final DialogType type;
  final Function()? onConfirm;
  final Function()? onCancel;
  final bool barrierDismissible;
  final bool buttonDismissible;

  const DialogWidget({
    Key? key,
    required this.title,
    this.message,
    this.type = DialogType.warning,
    this.onCancel,
    this.onConfirm,
    this.barrierDismissible = false,
    this.buttonDismissible = true,
  }) : super(key: key);

  Widget get _buildHeader {
    String path = "";
    bool repeat = true;

    switch (type) {
      case DialogType.info:
        path = Assets.lottie.dialog.info;
        repeat = true;
        break;

      case DialogType.error:
        path = Assets.lottie.dialog.error;
        repeat = false;
        break;

      case DialogType.success:
        path = Assets.lottie.dialog.success;
        repeat = false;
        break;

      case DialogType.warning:
        path = Assets.lottie.dialog.warning;
        repeat = false;
        break;

      default:
        path = Assets.lottie.dialog.info;
        repeat = false;
    }

    return Lottie.asset(
      path,
      repeat: repeat,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget buildMessage() => message != null
        ? Text(message!, textAlign: TextAlign.center)
        : const SizedBox();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WillPopScope(
        onWillPop: () async {
          return (barrierDismissible) ? true : false;
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (barrierDismissible) Navigator.of(context).pop();
          },
          child: GestureDetector(
            // ignore: no-empty-block
            onTap: () {},
            child: Center(
              child: FadeIn(
                child: ZoomIn(
                  duration: const Duration(milliseconds: 300),
                  child: VerticalStackDialog(
                    dialogBackgroundColor: context.theme.cardColor,
                    header: _buildHeader,
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        buildMessage(),
                      ],
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    btnOk: (onConfirm != null)
                        ? PillButton(
                            onPressed: () {
                              if (buttonDismissible) Get.back();
                              onConfirm!();
                            },
                            color: const Color(0xFF00CA71),
                            padding: 10,
                            child: const Text(
                              "Confirmar",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : null,
                    btnCancel: (onCancel != null)
                        ? PillButton(
                            onPressed: () {
                              if (buttonDismissible) Get.back();
                              if (onCancel != null) onCancel!();
                            },
                            color: Colors.grey,
                            padding: 10,
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
