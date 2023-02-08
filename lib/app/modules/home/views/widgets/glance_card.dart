import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/utils/color.dart';

import '../../../../../constants/values.dart';

class GlanceCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  final IconData icon;
  final Function()? onTap;

  const GlanceCard({
    Key? key,
    required this.color,
    required this.title,
    required this.value,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppValues.kRoundedMedium,
      child: Material(
        color: Get.isDarkMode ? color.darken(20) : color.lighten(40),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.3),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20),
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
          child: AutoSizeText(
            value,
            maxLines: 1,
            textAlign: TextAlign.end,
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
    return AutoSizeText(
      title,
      maxLines: 2,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(),
    );
  }
}
