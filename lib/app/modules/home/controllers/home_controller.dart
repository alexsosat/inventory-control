import 'package:get/get.dart';
import '../../../data/models/notifications/notification.dart';

import '../../../data/models/lote/lote.dart';
import '../../../data/providers/lote_provider.dart';
import '../../../data/providers/notification_provider.dart';
import '../../../data/providers/product_provider.dart';
import 'notification_count_controller.dart';

class HomeController extends GetxController with StateMixin {
  final ProductProvider _productProvider = ProductProvider();
  final LoteProvider _lotesProvider = LoteProvider();
  final NotificationProvider _notificationProvider = NotificationProvider();

  int registeredProducts = 0;
  int expiredLotes = 0;
  int closeToExpireLotes = 0;
  int goodLotes = 0;

  @override
  void onInit() {
    super.onInit();
    _calculateData();
  }

  Future loadData() async {
    change(null, status: RxStatus.loading());
    try {
      registeredProducts = await _productProvider.getProductCount();
      goodLotes = await _lotesProvider.getLotesByStatusCount(LoteStatus.good);
      expiredLotes =
          await _lotesProvider.getLotesByStatusCount(LoteStatus.expired);
      closeToExpireLotes =
          await _lotesProvider.getLotesByStatusCount(LoteStatus.toExpire);
      change(null, status: RxStatus.success());
    } on Exception catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void _calculateData() async {
    try {
      await _checkCloseToExpireLotes();
      await _checkGoodLotes();

      Get.find<NotificationCountController>().loadNotificationsCount();
      await loadData();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  /// Moves Lotes from close to expire to expired
  Future<void> _checkCloseToExpireLotes() async {
    try {
      final closeToExpireLotes =
          await _lotesProvider.getLotesByStatus(LoteStatus.toExpire);
      for (Lote lote in closeToExpireLotes) {
        if (lote.dateExpiration.isBefore(DateTime.now())) {
          await _lotesProvider.updateLoteStatus(
            lote: lote,
            moveTo: LoteStatus.expired,
          );

          await _notificationProvider.createNotification(
            NotificationAlert(
              title: "Lote vencido",
              body: "El lote ${lote.loteUID} ha vencido",
            ),
          );
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  /// Moves Lotes from good to close to expire
  /// if the date is before 90 days from now
  Future<void> _checkGoodLotes() async {
    try {
      final goodLotes = await _lotesProvider.getLotesByStatus(LoteStatus.good);

      for (Lote lote in goodLotes) {
        if (lote.dateExpiration.isBefore(DateTime.now())) {
          await _lotesProvider.updateLoteStatus(
            lote: lote,
            moveTo: LoteStatus.expired,
          );

          await _notificationProvider.createNotification(
            NotificationAlert(
              title: "Lote vencido",
              body: "El lote ${lote.loteUID} ha vencido",
            ),
          );
        } else if (lote.dateExpiration
            .isBefore(DateTime.now().add(const Duration(days: 90)))) {
          await _lotesProvider.updateLoteStatus(
            lote: lote,
            moveTo: LoteStatus.toExpire,
          );

          await _notificationProvider.createNotification(
            NotificationAlert(
              title: "Lote cerca de vencerse",
              body: "El lote ${lote.loteUID} esta a 3 meses de vencerse",
            ),
          );
        }
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
