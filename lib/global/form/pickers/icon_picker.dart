import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import '../../../utils/remove_focus.dart';

class IconPicker extends StatefulWidget {
  final IconData? initialIcon;
  final Function(Map<String, dynamic> icon) onIconPicked;

  const IconPicker({
    this.initialIcon,
    required this.onIconPicked,
    super.key,
  });

  @override
  State<IconPicker> createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  IconData? _selectedIcon;

  Map<String, dynamic>? _serializedIcon;

  @override
  void initState() {
    super.initState();
    if (widget.initialIcon != null) {
      _selectedIcon = widget.initialIcon;
    }
  }

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(
      context,
      iconPackModes: [IconPack.material],
      title: const Text("Elige un icono"),
      adaptiveDialog: true,
      showSearchBar: false,
      showTooltips: true,
    );

    if (icon == null) return;

    _serializedIcon = serializeIcon(icon);

    setState(() => _selectedIcon = icon);

    widget.onIconPicked(_serializedIcon!);
  }

  _getIconName() {
    if (_serializedIcon == null) return null;

    String iconName = _serializedIcon!["key"].toString();

    iconName = iconName.replaceAll("_", " ");

    return iconName;
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
            child: Icon(
              _selectedIcon ?? Icons.star_border_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      title: Text(_getIconName() ?? "Icono"),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        removeFocus(context);
        _pickIcon();
      },
    );
  }
}
