import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionData extends StatelessWidget {
  final String title;
  final Widget value;
  final IconData? icon;
  const DescriptionData({
    Key? key,
    required this.title,
    required this.value,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null)
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(
                        icon,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      "$title:",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              value,
            ],
          ),
        ),
      ],
    );
  }
}
