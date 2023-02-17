import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:inventory_control/constants/values.dart';
import '../../../app/modules/tag_picker/controllers/tag_list_controller.dart';

import '../../../app/data/models/tag/tag.dart';

class TagFilterSection extends StatefulWidget {
  final Function(String? type) onTypeChanged;
  final Color selectedTagColor;

  const TagFilterSection({
    super.key,
    required this.onTypeChanged,
    required this.selectedTagColor,
  });

  @override
  State<TagFilterSection> createState() => _TagFilterSectionState();
}

class _TagFilterSectionState extends State<TagFilterSection> {
  late TagListController _tagListController;
  final controller = GroupButtonController();

  @override
  void initState() {
    _tagListController = Get.find<TagListController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: _tagListController.obx(
        (tags) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          children: [
            GroupButton<Tag>(
              controller: controller,
              buttons: tags!,
              enableDeselect: true,
              buttonBuilder: (selected, filter, context) => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: AppValues.kRoundedMax,
                  color: selected ? widget.selectedTagColor : Colors.grey[300],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      filter.icon == null
                          ? Icons.tag
                          : deserializeIcon(
                              json.decode(filter.icon!),
                            ),
                      color: selected ? Colors.white : null,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      filter.name,
                      style: TextStyle(
                        color: selected ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),

              // FilledButton.icon(
              //   onPressed: () {
              //     final filterIndex = tags.indexOf(filter);

              //     controller.selectIndex(filterIndex);
              //   },
              //   style: FilledButton.styleFrom(
              //     backgroundColor: selected
              //         ? Theme.of(context).colorScheme.secondary
              //         : Colors.grey[400],
              //     foregroundColor: selected ? Colors.white : Colors.grey,
              //   ),
              //   icon: Icon(
              //     filter.icon == null
              //         ? Icons.tag
              //         : deserializeIcon(
              //             json.decode(filter.icon!),
              //           ),
              //   ),
              //   label: Text(
              //     filter.name,
              //     style: TextStyle(
              //       color: selected ? Colors.white : null,
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}
