import 'package:isar/isar.dart';

import '../models/storages/storage.dart';

class StorageProvider {
  late Isar isar;

  StorageProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get all the storages from the database.
  Future<List<Storage>> getStorageList() async =>
      isar.storages.where().findAll();

  /// "Add a storage to the database and return the id of the newly added storage."
  /// Args:
  ///   storage (Storage): The storage object to be added to the database.
  Future<int> addStorage(Storage storage) async => isar.writeTxn<int>(
        () => isar.storages.put(storage),
      );
}
