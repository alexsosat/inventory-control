import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/values.dart';

class GlanceCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  final IconData icon;

  const GlanceCard({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.brighten(70),
            borderRadius: AppValues.kRoundedMedium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _GlanceCardHeader(
                value: value,
                icon: icon,
                color: color,
              ),
              const Expanded(child: SizedBox()),
              _GlanceCardTitle(title: title),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlanceCardHeader extends StatelessWidget {
  final String value;
  final IconData icon;
  final Color color;

  const _GlanceCardHeader({
    Key? key,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

class _GlanceCardTitle extends StatelessWidget {
  final String title;

  const _GlanceCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
    );
  }
}
