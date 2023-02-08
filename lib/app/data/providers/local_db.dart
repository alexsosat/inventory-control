import 'package:isar/isar.dart';

import '../models/lote/lote.dart';
import '../models/product/product.dart';
import '../models/storages/storage.dart';
import '../models/tag/tags.dart';

class LocalDBService {
  Future<Isar> initDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [
          StorageSchema,
          LoteSchema,
          TagsSchema,
          ProductSchema,
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
