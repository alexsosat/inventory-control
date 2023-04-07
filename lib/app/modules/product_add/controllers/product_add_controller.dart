import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/product_list/controllers/product_list_controller.dart';
import '../../../data/models/product_presentation/product_presentation.dart';

import '../../../../global/overlays/dialog/dialog.dart';
import '../../../../services/local_database/call_function.dart';
import '../../../data/models/product/product.dart';
import '../../../data/models/tag/tag.dart';
import '../../../data/providers/product_provider.dart';
import '../../home/controllers/home_controller.dart';

class ProductAddController extends GetxController {
  final Product? product;

  ProductAddController(this.product);

  final ProductProvider _provider = ProductProvider();

  final formKey = GlobalKey<FormState>(debugLabel: '_AddProductFormState');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<Tag> tags = [];
  List<ProductPresentation> presentations = [];
  Color color = Colors.blueGrey;

  bool get isEditing => product != null;

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  void _initData() {
    if (isEditing) {
      nameController.text = product!.name;
      descriptionController.text = product!.description ?? "";
      color = colorFromHex(product!.hexColor) ?? Colors.blueGrey;
      tags = product!.tags.toList();
      presentations = product!.presentations.toList();
    }
  }

  saveProduct() async {
    late Product addProduct;

    if (isEditing) {
      addProduct = product!;
      addProduct.name = nameController.text;
      addProduct.description = descriptionController.text;
      addProduct.hexColor = colorToHex(color);
    } else {
      addProduct = Product(
        name: nameController.text,
        description: descriptionController.text,
        hexColor: colorToHex(color),
      );
    }

    addProduct.tags.clear();
    addProduct.presentations.clear();

    for (Tag tag in tags) {
      addProduct.tags.add(tag);
    }

    for (ProductPresentation presentation in presentations) {
      addProduct.presentations.add(presentation);
    }

    baseActionCall(
      loadingText: 'Registrando Producto...',
      call: () => _provider.addProduct(addProduct),
      onSuccess: (_) => openDialogWindow(
        title: "Se registro el producto",
        type: DialogType.success,
        onConfirm: () => {
          if (Get.arguments is Product)
            {
              Get.find<ProductListController>().loadProducts(),
              Get.back(),
              Get.back()
            }
          else
            {
              Get.find<HomeController>().loadData(),
              Get.back(),
            },
        },
      ),
    );
  }
}
