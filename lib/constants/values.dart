import 'package:flutter/material.dart';

class AppValues {
  static const kRoundedSmall = BorderRadius.all(Radius.circular(7.0));
  static const kRoundedMedium = BorderRadius.all(Radius.circular(15.0));
  static const kRoundedMax = BorderRadius.all(Radius.circular(25.0));
  static const kCardRoundness = BorderRadius.all(Radius.circular(20.0));

  static const kBorderWidth = 2.0;

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 10,
    )
  ];
}
