import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/product_presentation/product_presentation.dart';
import '../../../data/providers/product_presentations_provider.dart';
import '../../product_presentation_list/controllers/product_presentation_list_controller.dart';

class ProductPresentationAddController extends GetxController {
  final ProductPresentationProvider _provider = ProductPresentationProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddTagFormState');

  final TextEditingController nameController = TextEditingController();
  MeasureUnit? measureUnit;

  savePresentation() {
    baseActionCall(
      loadingText: 'Registrando Presentación...',
      call: () => _provider.addPresentation(
        ProductPresentation(
          name: nameController.text,
          unit: measureUnit!,
        ),
      ),
      onSuccess: (_) => openDialogWindow(
        title:
            "Se registro la presentación ${nameController.text} ${measureUnit!.name}",
        type: DialogType.success,
        onConfirm: () => {
          Get.find<ProductPresentationListController>().loadPresentations(),
          Get.back(),
        },
      ),
    );
  }
}
