import 'package:isar/isar.dart';

import '../models/storages/storage.dart';

class StorageProvider {
  final Isar? isar;

  StorageProvider() : isar = Isar.getInstance();

  Isar get localDb {
    if (isar == null) {
      throw Exception('Isar is not initialized');
    }
    return isar!;
  }

  /// Get all the storages from the database.
  Future<List<Storage>> getStorageList() async =>
      localDb.storages.where().findAll();

  /// "Add a storage to the database and return the id of the newly added storage."
  /// Args:
  ///   storage (Storage): The storage object to be added to the database.
  Future<int> addStorage(Storage storage) async => localDb.writeTxn<int>(
        () => localDb.storages.put(storage),
      );
}
