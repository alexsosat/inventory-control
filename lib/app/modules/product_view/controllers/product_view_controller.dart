import 'package:get/get.dart';

import '../../../data/models/lote/lote.dart';
import '../../../data/models/product/product.dart';
import '../../../data/models/storages/storage.dart';
import '../../../data/providers/lote_provider.dart';
import '../../../data/providers/product_provider.dart';
import '../../home/controllers/home_controller.dart';
import '../../product_list/controllers/product_list_controller.dart';
import '../models/lote_storage_model_bind.dart';

class ProductViewController extends GetxController
    with StateMixin<LoteStorageModelBind> {
  final Product product;

  ProductViewController(this.product);

  final LoteProvider _loteProvider = LoteProvider();
  final ProductProvider _productProvider = ProductProvider();

  final storageIndex = 0.obs;

  @override
  void onInit() {
    loadLotes();
    super.onInit();
  }

  void loadLotes() async {
    try {
      final lotes = await _loteProvider.getLotesByProduct(product.id);

      if (lotes.isEmpty) {
        change(null, status: RxStatus.empty());
        return;
      }

      List<Storage> storages = _getStorages(lotes);

      change(
        LoteStorageModelBind(storages, lotes),
        status: RxStatus.success(),
      );
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  deleteProduct() async {
    try {
      await _productProvider.deleteProduct(product.id);
      Get.find<ProductListController>().loadProducts();
      Get.find<HomeController>().loadData();
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  _getStorages(List<Lote> lote) =>
      lote.map((e) => e.storage.value!).toSet().toList();

  List<Lote> getLotesByStorage(Storage storage) => state!.lotes
      .where((element) => element.storage.value == storage)
      .toList();
}
