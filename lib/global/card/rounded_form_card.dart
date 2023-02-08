import 'package:flutter/material.dart';
import 'package:inventory_control/constants/values.dart';

class RoundedFormCard extends StatelessWidget {
  final List<Widget> children;
  const RoundedFormCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: AppValues.kRoundedMedium,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
