import 'package:flutter/material.dart';

class DateAscDescDropdown extends StatefulWidget {
  final Function(int value) onChanged;
  const DateAscDescDropdown({required this.onChanged, super.key});

  @override
  State<DateAscDescDropdown> createState() => _DateAscDescDropdownState();
}

class _DateAscDescDropdownState extends State<DateAscDescDropdown> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: _selectedValue,
      isExpanded: true,
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('Ascendente'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('Descendente'),
        ),
      ],
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged(_selectedValue);
      },
    );
  }
}
