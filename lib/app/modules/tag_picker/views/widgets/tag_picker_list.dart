import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/tag/tag.dart';
import '../../controllers/tag_picker_controller.dart';
import 'tag_checkbox_tile.dart';

class TagPickerList extends GetView<TagPickerController> {
  final List<Tag> tags;
  const TagPickerList(this.tags, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tags.length,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      itemBuilder: (context, i) => TagCheckBoxTile(
        tags[i],
        onChanged: (value) {
          if (value) {
            controller.selectedTags.add(tags[i]);
          } else {
            controller.selectedTags.remove(tags[i]);
          }
        },
      ),
    );
  }
}
