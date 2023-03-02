import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import '../../models/lote_trasspass_model.dart';
import '../../../../../global/form/dropdowns/storage_dropdown.dart';

import '../../../../../global/form/text_form_field_rounded.dart';
import '../../../../data/models/storages/storage.dart';

class LoteTrasspassDialog extends StatefulWidget {
  const LoteTrasspassDialog({super.key});

  @override
  State<LoteTrasspassDialog> createState() => _LoteTrasspassDialogState();
}

class _LoteTrasspassDialogState extends State<LoteTrasspassDialog> {
  final _formKey = GlobalKey<FormState>();

  Storage? storageValue;
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StorageDropdown(
              onChanged: (storage) => setState(
                () => storageValue = storage,
              ),
            ),
            const SizedBox(height: 20),
            TextFormFieldRounded(
              controller: quantityController,
              labelText: 'Cantidad',
              inputAction: TextInputAction.done,
              inputType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              formatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
              ],
            ),
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
                result: TrasspassModel(
                  quantity: double.parse(quantityController.text),
                  storage: storageValue!,
                ),
              );
            }
          },
          child: const Text("Aceptar"),
        ),
      ],
    );
  }
}
