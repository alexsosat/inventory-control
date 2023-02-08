import 'package:get/get.dart';

import '../../../data/providers/lotes_provider.dart';
import '../../../data/providers/products_provider.dart';

class HomeController extends GetxController with StateMixin {
  final ProductProvider _productProvider = ProductProvider();
  final LotesProvider _lotesProvider = LotesProvider();

  int registeredProducts = 0;
  int expiredLotes = 0;
  int closeToExpireLotes = 0;
  int goodLotes = 0;

  @override
  void onInit() {
    super.onInit();
    calculateData();
    loadData();
  }

  void calculateData() {
    //TODO: Implementar lógica para expirar lotes y calcular tiempo restante de lotes buenos
  }

  void loadData() async {
    change(null, status: RxStatus.loading());
    try {
      registeredProducts = await _productProvider.getProductCount();
      goodLotes = await _lotesProvider.getGoodLotesCount();
      expiredLotes = await _lotesProvider.getExpiredLotesCount();
      closeToExpireLotes = await _lotesProvider.getToExpireLotesCount();
      change(null, status: RxStatus.success());
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
