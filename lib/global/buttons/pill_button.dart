import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/remove_focus.dart';

class PillButton extends StatelessWidget {
  ///Method executed when this button is pressed
  final Function() onPressed;

  ///The button filled color
  final Color? color;

  ///The content inside the button
  final Widget child;

  ///The padding surrounding the content
  final double padding;

  final bool expanded;

  const PillButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.padding = 18,
    this.expanded = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        removeFocus(context);
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: EdgeInsets.all(padding),
        backgroundColor: color ?? Get.theme.colorScheme.secondary,
        minimumSize: expanded ? const Size.fromHeight(50) : null,
      ),
      child: child,
    );
  }
}
