import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/storage_add_controller.dart';
import 'sections/storage_add_form.dart';

class StorageAddView extends GetView<StorageAddController> {
  const StorageAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Bodega'),
        centerTitle: false,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: StorageAddForm(),
        ),
      ),
    );
  }
}
