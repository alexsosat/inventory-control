import 'package:get/get.dart';

import '../../../data/models/tag/tag.dart';
import '../../../data/providers/tag_provider.dart';

class TagFilterController extends GetxController with StateMixin<List<Tag>> {
  final _provider = TagProvider();

  TagFilterController(this.selectedTags);

  List<Tag> selectedTags;

  @override
  void onInit() {
    loadTags();
    super.onInit();
  }

  loadTags() async {
    change(null, status: RxStatus.loading());
    try {
      final tags = await _provider.getAllTags();

      tags.isNotEmpty
          ? change(tags, status: RxStatus.success())
          : change(null, status: RxStatus.empty());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
