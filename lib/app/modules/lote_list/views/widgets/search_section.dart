import 'package:flutter/material.dart';

import '../../../../../global/buttons/tag_buttons/tag_buttons.dart';
import '../../../../../global/form/search_field.dart';

class LoteSearchSection extends StatelessWidget {
  final Color? storageColor;
  const LoteSearchSection({
    required this.storageColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SearchField(
            controller: TextEditingController(),
            label: "Buscador",
          ),
        ),
        const SizedBox(height: 10),
        TagFilterSection(
          selectedTagColor: storageColor ?? Theme.of(context).primaryColor,
          onTypeChanged: (_) {},
        ),
      ],
    );
  }
}
