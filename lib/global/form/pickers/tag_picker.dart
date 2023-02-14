import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../app/data/models/tag/tag.dart';
import '../../../app/routes/app_pages.dart';
import '../../../utils/remove_focus.dart';

class TagPicker extends StatefulWidget {
  final List<Tag>? selectedTags;
  final Function(List<Tag> tags) onTagsChanged;
  const TagPicker({
    required this.onTagsChanged,
    this.selectedTags,
    super.key,
  });

  @override
  State<TagPicker> createState() => _TagPickerState();
}

class _TagPickerState extends State<TagPicker> {
  late List<Tag> _selectedTags;

  @override
  void initState() {
    _selectedTags = widget.selectedTags ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.tag_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      title: const Text("Tags"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _selectedTags.length.toString(),
            style: const TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
      onTap: () async {
        removeFocus(context);

        final tags = await Get.toNamed(
              Routes.TAG_PICKER,
              arguments: _selectedTags,
            ) ??
            [];
        _selectedTags = tags as List<Tag>;

        widget.onTagsChanged(_selectedTags);

        setState(() {});
      },
    );
  }
}
