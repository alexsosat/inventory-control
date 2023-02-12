import 'package:get/get.dart';

import '../data/models/tag/tag.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_add/bindings/product_add_binding.dart';
import '../modules/product_add/views/product_add_view.dart';
import '../modules/storage_add/bindings/storage_add_binding.dart';
import '../modules/storage_add/views/storage_add_view.dart';
import '../modules/tag_add/bindings/tag_add_binding.dart';
import '../modules/tag_add/views/tag_add_view.dart';
import '../modules/tag_picker/bindings/tag_picker_binding.dart';
import '../modules/tag_picker/views/tag_picker_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STORAGE_ADD,
      page: () => const StorageAddView(),
      binding: StorageAddBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD,
      page: () => const ProductAddView(),
      binding: ProductAddBinding(),
    ),
    GetPage(
      name: _Paths.TAG_PICKER,
      page: () => const TagPickerView(),
      binding: TagPickerBinding(),
    ),
    GetPage(
      name: _Paths.TAG_ADD,
      page: () => const TagAddView(),
      binding: TagAddBinding(),
    ),
  ];
}
