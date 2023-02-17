import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/models/tag/tag.dart';
import 'widgets/tag_picker_list.dart';

import '../../../routes/app_pages.dart';
import '../controllers/tag_list_controller.dart';

class TagListView extends GetView<TagListController> {
  const TagListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back<List<Tag>>(result: controller.selectedTags);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Elige las etiquetas'),
          centerTitle: false,
          leading: BackButton(
            onPressed: () =>
                Get.back<List<Tag>>(result: controller.selectedTags),
          ),
        ),
        body: controller.obx(
          (tags) => TagPickerList(tags!),
          onEmpty: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No existen etiquetas',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(),
                ),
                const SizedBox(height: 10),
                Text(
                  'Crea tu primera etiqueta pulsando el botón de la esquina',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.TAG_ADD),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
