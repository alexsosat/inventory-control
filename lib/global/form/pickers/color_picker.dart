import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerField extends StatefulWidget {
  final Function(Color) onColorChanged;

  const ColorPickerField({
    required this.onColorChanged,
    super.key,
  });

  @override
  State<ColorPickerField> createState() => _ColorPickerFieldState();
}

class _ColorPickerFieldState extends State<ColorPickerField> {
  Color pickerColor = const Color(0xff443a49);
  Color? currentColor;

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: currentColor ?? Colors.blueGrey,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.colorize_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      title: Text(
        currentColor == null
            ? 'Color'
            : colorToHex(
                currentColor!,
                enableAlpha: false,
                includeHashSign: true,
              ),
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Elige un color'),
              content: MaterialPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Seleccionar'),
                  onPressed: () {
                    setState(() => currentColor = pickerColor);
                    Navigator.of(context).pop();
                    widget.onColorChanged(pickerColor);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
