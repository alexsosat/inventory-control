import 'package:get/get.dart';

import '../../../data/models/lote/lote.dart';
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
    _calculateData();
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

  void _calculateData() {
    try {
      _checkCloseToExpireLotes();
      _checkGoodLotes();

      loadData();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  /// Moves Lotes from close to expire to expired
  void _checkCloseToExpireLotes() async {
    try {
      final closeToExpireLotes = await _lotesProvider.getToExpireLotes();
      for (Lote lote in closeToExpireLotes) {
        if (lote.dateExpiration.isBefore(DateTime.now())) {
          _lotesProvider.moveLoteToExpired(lote);
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  /// Moves Lotes from good to close to expire
  /// if the date is before 90 days from now
  void _checkGoodLotes() async {
    try {
      final goodLotes = await _lotesProvider.getGoodLotes();
      for (Lote lote in goodLotes) {
        if (lote.dateExpiration
            .isBefore(DateTime.now().subtract(const Duration(days: 90)))) {
          _lotesProvider.moveLoteToCloseToExpired(lote);
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
