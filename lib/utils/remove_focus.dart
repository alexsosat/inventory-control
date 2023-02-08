import 'package:flutter/material.dart';

/// If the current focus is not the primary focus, unfocus it
///
/// This is useful when you want to unfocus a text field when a button is pressed
///
/// Args:
///   context (BuildContext): The context of the widget that you want to remove focus from.
void removeFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}
