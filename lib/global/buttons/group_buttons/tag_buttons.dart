import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';
import 'package:inventory_control/constants/values.dart';
import '../../../app/modules/tag_list/controllers/tag_list_controller.dart';

import '../../../app/data/models/tag/tag.dart';

class TagFilterSection extends StatefulWidget {
  final Function(Tag tag, bool isSelected) onTypeChanged;
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
    return _tagListController.obx(
      (tags) => GroupButton<Tag>(
        controller: controller,
        buttons: tags!,
        enableDeselect: true,
        isRadio: false,
        onSelected: (value, index, isSelected) => widget.onTypeChanged(
          value,
          isSelected,
        ),
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
      ),
    );
  }
}
