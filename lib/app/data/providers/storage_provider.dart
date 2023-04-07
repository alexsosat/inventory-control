import 'package:isar/isar.dart';
import 'package:collection/collection.dart';

import '../models/lote/lote.dart';
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

  /// Get a storage by its id.
  Future<Storage?> getStorageById(int storageId) async =>
      isar.storages.where().idEqualTo(storageId).findFirst();

  /// Get all the lotes from the storage.
  Future<List<Lote>> getStorageLotes(int storageId) async {
    final storage = await getStorageById(storageId);
    if (storage == null) {
      return [];
    }
    return storage.lotes.toList();
  }

  /// "Add a storage to the database and return the id of the newly added storage."
  /// Args:
  ///   storage (Storage): The storage object to be added to the database.
  Future<int> addStorage(Storage storage) async => isar.writeTxn<int>(
        () => isar.storages.put(storage),
      );

  /// Search lote by its UID.
  /// Args:
  ///  loteUID (String): The UID of the lote to be searched.
  /// storageId (int): The id of the storage where the lote is located.
  /// Returns:
  /// Lote: The lote object if found, null otherwise.
  Future<Lote?> searchLoteByUID(String loteUID, int storageId) async {
    final storage = await getStorageById(storageId);
    if (storage == null) {
      return null;
    }
    return storage.lotes.firstWhereOrNull(
      (lote) => lote.loteUID == loteUID,
    );
  }

  /// Delete a storage from the database.
  /// Args:
  ///  storageId (int): The id of the storage to be deleted
  Future<void> deleteStorage(int storageId) async => isar.writeTxn(
        () => isar.storages.delete(storageId),
      );
}
