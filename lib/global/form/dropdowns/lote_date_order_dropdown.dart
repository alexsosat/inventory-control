import 'package:flutter/material.dart';

class LoteDateOrderDropdown extends StatefulWidget {
  final Function(int? value) onChanged;
  const LoteDateOrderDropdown({required this.onChanged, super.key});

  @override
  State<LoteDateOrderDropdown> createState() => _LoteDateOrderDropdownState();
}

class _LoteDateOrderDropdownState extends State<LoteDateOrderDropdown> {
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: _selectedValue,
      isExpanded: true,
      items: const [
        DropdownMenuItem(
          value: 0,
          child: Text('No ordenar'),
        ),
        DropdownMenuItem(
          value: 1,
          child: Text('Fecha creación'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Fecha expiración'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('Fecha manufacturación'),
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
