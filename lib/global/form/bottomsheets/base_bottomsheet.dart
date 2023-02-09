import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../constants/values.dart';

class BaseBottomSheet<T> extends StatefulWidget {
  final bool isRequired;
  final Function(T) onChanged;
  final Function(T)? validator;
  final List<T> items;
  final String labelText;

  const BaseBottomSheet({
    required this.onChanged,
    required this.items,
    required this.labelText,
    this.validator,
    this.isRequired = true,
    super.key,
  });

  @override
  State<BaseBottomSheet<T>> createState() => _BaseBottomSheetState<T>();
}

class _BaseBottomSheetState<T> extends State<BaseBottomSheet<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      popupProps: const PopupProps.bottomSheet(
        showSelectedItems: true,
      ),
      items: widget.items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: widget.labelText,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          contentPadding: const EdgeInsets.all(20),
          labelStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
            borderRadius: AppValues.kRoundedMax,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: AppValues.kRoundedMax,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.red,
            ),
            borderRadius: AppValues.kRoundedMax,
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.red,
            ),
            borderRadius: AppValues.kRoundedMax,
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.0,
              color: Colors.transparent,
            ),
            borderRadius: AppValues.kRoundedMax,
          ),
        ),
      ),
      onChanged: (value) {
        if (value != null) {
          widget.onChanged(value);
        }
      },
      compareFn: (item1, item2) => item1 == item2,
      validator: (value) {
        if (widget.isRequired) {
          if (value == null) {
            return "Favor de llenar este campo";
          }
        }
        if (widget.validator != null) {
          return widget.validator!(value as T);
        }

        return null;
      },
    );
  }
}
