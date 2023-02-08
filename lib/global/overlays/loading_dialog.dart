import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

/// Opens a loading dialog with a loading message [text]
void openLoadingDialog(String text) {
  Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 35,
              child: SpinKitFoldingCube(
                color: Get.theme.primaryColor,
                size: 30,
              ),
            ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
