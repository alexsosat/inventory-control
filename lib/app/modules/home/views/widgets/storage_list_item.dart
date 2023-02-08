import 'package:flutter/material.dart';

class StorageListItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const StorageListItem({
    Key? key,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.warehouse_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
