import 'package:flutter/material.dart';

import '../../../../../global/card/rounded_form_card.dart';
import '../../../../../global/form/text_form_field_rounded.dart';

class StorageAddForm extends StatefulWidget {
  const StorageAddForm({super.key});

  @override
  State<StorageAddForm> createState() => _StorageAddFormState();
}

class _StorageAddFormState extends State<StorageAddForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_AddStorageFormState');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormFieldRounded(
            controller: _nameController,
            labelText: 'Nombre',
          ),
          const SizedBox(height: 20),
          TextFormFieldRounded(
            controller: _addressController,
            labelText: 'Dirección',
            maxLines: 5,
            inputType: TextInputType.multiline,
            inputAction: TextInputAction.newline,
          ),
          const SizedBox(height: 20),
          const RoundedFormCard(),
        ],
      ),
    );
  }
}
