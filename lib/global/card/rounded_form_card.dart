import 'package:flutter/material.dart';

class RoundedFormCard extends StatelessWidget {
  const RoundedFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox.shrink(),
      ),
    );
  }
}
