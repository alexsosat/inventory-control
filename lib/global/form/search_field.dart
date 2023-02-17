import 'package:flutter/material.dart';

import '../../../constants/values.dart';
import 'text_form_field_rounded.dart';

class SearchField extends StatelessWidget {
  ///The text editing controller
  final TextEditingController controller;

  ///The call method when the input changes
  final Function(String)? onChanged;

  ///The hint text of the field
  final String label;

  const SearchField({
    Key? key,
    required this.controller,
    this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormFieldRounded(
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      controller: controller,
      prefixWidget: Icon(
        Icons.search_rounded,
        color: Theme.of(context).primaryColorDark,
      ),
      inputAction: TextInputAction.search,
      labelText: label,
      labelBehavior: FloatingLabelBehavior.never,
      labelColor: Theme.of(context).colorScheme.secondary,
      outlineEnable: false,
      borderRadius: AppValues.kRoundedMax,
    );
  }
}
