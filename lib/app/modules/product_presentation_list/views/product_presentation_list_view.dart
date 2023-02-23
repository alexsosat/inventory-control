import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_presentation/product_presentation.dart';
import '../../../routes/app_pages.dart';
import '../controllers/product_presentation_list_controller.dart';
import 'widgets/product_presentation_picker_list.dart';

class ProductPresentationListView
    extends GetView<ProductPresentationListController> {
  const ProductPresentationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back<List<ProductPresentation>>(
            result: controller.selectedPresentations);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de presentaciones'),
          centerTitle: false,
          leading: BackButton(
            onPressed: () => Get.back<List<ProductPresentation>>(
                result: controller.selectedPresentations),
          ),
        ),
        body: controller.obx(
          (tags) => ProductPresentationPickerList(tags!),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No existen presentaciones',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                ),
                const SizedBox(height: 10),
                Text(
                  'Crea tu primera presentación pulsando el botón de la esquina',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.PRODUCT_PRESENTATION_ADD),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
