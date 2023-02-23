import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/Serialization/iconDataSerialization.dart';

class IconCheckBoxTile extends StatefulWidget {
  final Function(bool value) onChanged;
  final bool initialValue;
  final String title;
  final IconData icon;

  const IconCheckBoxTile({
    super.key,
    required this.onChanged,
    required this.title,
    required this.icon,
    this.initialValue = false,
  });

  @override
  State<IconCheckBoxTile> createState() => _IconCheckBoxTileState();
}

class _IconCheckBoxTileState extends State<IconCheckBoxTile> {
  bool _value = false;

  @override
  void initState() {
    _value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: _value,
      secondary: Icon(widget.icon),
      onChanged: (_) {
        setState(
          () => _value = !_value,
        );

        widget.onChanged(_value);
      },
    );
  }
}
