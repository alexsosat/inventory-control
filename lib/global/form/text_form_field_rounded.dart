import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/values.dart';

class TextFormFieldRounded extends StatefulWidget {
  ///The input controller
  final TextEditingController controller;

  ///The validations made when the value is submitted
  final String? Function(String)? validator;

  ///A method that executes every time the field changes
  final Function(String)? onChanged;

  ///A method that executes when the field is submitted
  final Function(String)? onSubmitted;

  ///The keyboard type of the input
  final TextInputType inputType;

  ///True if the input of this field must be hide
  final bool obscureText;

  ///The input formatters
  final List<TextInputFormatter> formatters;

  ///The action done when clicking the finish keyboard key
  final TextInputAction inputAction;

  ///The color of the input field
  final Color? inputColor;

  ///The label behaviour when focused
  final FloatingLabelBehavior? labelBehavior;

  ///The text hint of the input
  final String? labelText;

  ///The text color hint of the input
  final Color? labelColor;

  ///The prefix widget of the input
  final Widget? prefixWidget;

  ///The suffix widget of the input
  final Widget? suffixWidget;

  ///The input color when focused
  final Color? focusColor;

  ///The input color when hovered
  final Color? hoverColor;

  ///The background color of the field
  final Color? backgroundColor;

  ///The oulineColor when enable
  final Color? outlineEnabledColor;

  ///The oulineColor when focused
  final Color? outlineFocusedColor;

  ///True if the outline of the input is visible
  final bool outlineEnable;

  ///The roundness of the input
  final BorderRadius borderRadius;

  ///The amount of lines available for the input
  final int? maxLines;

  ///True if the field is required to be filled in the form
  final bool isRequired;

  ///True if the textfield is editable
  final bool isEnabled;

  const TextFormFieldRounded({
    Key? key,
    required this.controller,
    this.inputType = TextInputType.text,
    this.formatters = const [],
    this.inputAction = TextInputAction.next,
    this.inputColor,
    this.outlineEnable = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.isRequired = true,
    this.prefixWidget,
    this.suffixWidget,
    this.validator,
    this.labelBehavior = FloatingLabelBehavior.auto,
    this.labelText,
    this.focusColor,
    this.hoverColor,
    this.labelColor,
    this.outlineEnabledColor,
    this.outlineFocusedColor,
    this.borderRadius = AppValues.kRoundedMax,
    this.backgroundColor,
    this.onChanged,
    this.onSubmitted,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  State<TextFormFieldRounded> createState() => _TextFormFieldRoundedState();
}

class _TextFormFieldRoundedState extends State<TextFormFieldRounded> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Color getEnabledOutline(BuildContext context) =>
      widget.outlineEnabledColor != null
          ? widget.outlineEnabledColor!
          : Theme.of(context).primaryColor;

  Color getFocusedOutline(BuildContext context) =>
      widget.outlineFocusedColor != null
          ? widget.outlineFocusedColor!
          : Theme.of(context).primaryColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      maxLines: widget.maxLines,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: widget.obscureText,
      keyboardType: widget.inputType,
      controller: widget.controller,
      inputFormatters: widget.formatters,
      textInputAction: widget.inputAction,
      enabled: widget.isEnabled,
      style: TextStyle(
        fontSize: 15.0,
        color: widget.inputColor ?? Theme.of(context).colorScheme.primary,
      ),
      validator: (value) {
        if (widget.isRequired) {
          if (value == null || value.isEmpty) {
            _focusNode.requestFocus();
            return "Favor de llenar este campo";
          }
        }
        if (widget.validator != null) {
          final errorText = widget.validator!(value ?? "");
          if (errorText != null) {
            _focusNode.requestFocus();
            return errorText;
          }
        }

        return null;
      },
      onFieldSubmitted: widget.onSubmitted,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      decoration: InputDecoration(
        floatingLabelBehavior: widget.labelBehavior,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.labelColor ?? Theme.of(context).hintColor,
        ),
        alignLabelWithHint: true,
        prefixIcon: widget.prefixWidget,
        suffixIcon: widget.suffixWidget,
        filled: true,
        fillColor: widget.backgroundColor ?? Theme.of(context).cardColor,
        contentPadding: const EdgeInsets.all(20.0),
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        errorStyle: TextStyle(
          color: Theme.of(context).colorScheme.error, // or any other color
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.0,
            color: widget.outlineEnable
                ? getEnabledOutline(context)
                : Colors.transparent,
          ),
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.0,
            color: getFocusedOutline(context),
          ),
          borderRadius: widget.borderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.red,
          ),
          borderRadius: widget.borderRadius,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.0,
            color: Colors.red,
          ),
          borderRadius: widget.borderRadius,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.0,
            color: widget.outlineEnable
                ? getEnabledOutline(context)
                : Colors.transparent,
          ),
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }
}
