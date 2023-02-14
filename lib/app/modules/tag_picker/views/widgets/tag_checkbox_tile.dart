import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';

import '../../../../data/models/tag/tag.dart';

class TagCheckBoxTile extends StatefulWidget {
  final Tag tag;
  final Function(bool value) onChanged;
  final bool initialValue;
  const TagCheckBoxTile(
    this.tag, {
    super.key,
    required this.onChanged,
    this.initialValue = false,
  });

  @override
  State<TagCheckBoxTile> createState() => _TagCheckBoxTileState();
}

class _TagCheckBoxTileState extends State<TagCheckBoxTile> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.tag.name),
      value: _value,
      secondary: Icon(
        widget.tag.icon == null
            ? Icons.tag
            : deserializeIcon(
                json.decode(widget.tag.icon!),
              ),
      ),
      onChanged: (_) {
        setState(
          () => _value = !_value,
        );

        widget.onChanged(_value);
      },
    );
  }
}
