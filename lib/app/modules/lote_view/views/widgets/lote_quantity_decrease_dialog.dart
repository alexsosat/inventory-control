import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../global/form/text_form_field_rounded.dart';

class LoteQuantityDecreaseDialog extends StatefulWidget {
  const LoteQuantityDecreaseDialog({super.key});

  @override
  State<LoteQuantityDecreaseDialog> createState() =>
      _LoteQuantityDecreaseDialogState();
}

class _LoteQuantityDecreaseDialogState
    extends State<LoteQuantityDecreaseDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController quantityController;

  @override
  void initState() {
    quantityController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormFieldRounded(
          controller: quantityController,
          labelText: 'Cantidad',
          inputAction: TextInputAction.done,
          inputType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          formatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            "Cancelar",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Get.back(
                result: double.parse(quantityController.text),
              );
            }
          },
          child: const Text("Aceptar"),
        ),
      ],
    );
  }
}
