import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/remove_focus.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final Function(DateTime date) onDateChanged;

  const DatePicker({
    required this.label,
    required this.onDateChanged,
    super.key,
  });

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: (value) {
        if (value == null) {
          return 'Campo requerido';
        }
        return null;
      },
      builder: (formState) => ListTile(
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
                Icons.calendar_today_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        title: Text(
          _selectedDate == null
              ? widget.label
              : DateFormat('dd/MM/yyyy').format(_selectedDate!),
          style: formState.hasError ? const TextStyle(color: Colors.red) : null,
        ),
        subtitle: formState.hasError
            ? Text(
                formState.errorText!,
                style: const TextStyle(color: Colors.red),
              )
            : null,
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () async {
          removeFocus(context);

          _selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
            lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
          );

          if (_selectedDate != null) {
            widget.onDateChanged(_selectedDate!);
            formState.didChange(_selectedDate);
            setState(() {});
          }
        },
      ),
    );
  }
}
