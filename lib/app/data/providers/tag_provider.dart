import 'package:isar/isar.dart';

import '../models/tag/tag.dart';

class TagProvider {
  late Isar isar;

  TagProvider() {
    if (Isar.getInstance() == null) {
      throw Exception('Isar is not initialized');
    }
    isar = Isar.getInstance()!;
  }

  /// Get all tags
  Future<List<Tag>> getAllTags() async {
    return isar.tags.where().findAll();
  }

  Future<int> addTag(Tag tag) async =>
      isar.writeTxn(() async => isar.tags.put(tag));
}
