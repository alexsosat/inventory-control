import 'package:isar/isar.dart';

import '../../app/data/models/lote/lote.dart';
import '../../app/data/models/notifications/notification.dart';
import '../../app/data/models/product/product.dart';
import '../../app/data/models/product_presentation/product_presentation.dart';
import '../../app/data/models/storages/storage.dart';
import '../../app/data/models/tag/tag.dart';

class LocalDBService {
  Future<Isar> initDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          StorageSchema,
          LoteSchema,
          TagSchema,
          ProductSchema,
          ProductPresentationSchema,
          NotificationAlertSchema,
        ],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> closeDB() async {
    await Isar.getInstance()?.close();
  }
}
