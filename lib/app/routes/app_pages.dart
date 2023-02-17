import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lote_add/bindings/lote_add_binding.dart';
import '../modules/lote_add/views/lote_add_view.dart';
import '../modules/lote_list/bindings/lote_list_binding.dart';
import '../modules/lote_list/views/lote_list_view.dart';
import '../modules/product_add/bindings/product_add_binding.dart';
import '../modules/product_add/views/product_add_view.dart';
import '../modules/storage_add/bindings/storage_add_binding.dart';
import '../modules/storage_add/views/storage_add_view.dart';
import '../modules/tag_add/bindings/tag_add_binding.dart';
import '../modules/tag_add/views/tag_add_view.dart';
import '../modules/tag_picker/bindings/tag_list_binding.dart';
import '../modules/tag_picker/views/tag_list_view.dart';

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
      name: _Paths.TAG_LIST,
      page: () => const TagListView(),
      binding: TagPickerBinding(),
    ),
    GetPage(
      name: _Paths.TAG_ADD,
      page: () => const TagAddView(),
      binding: TagAddBinding(),
    ),
    GetPage(
      name: _Paths.LOTE_LIST,
      page: () => const LoteListView(),
      binding: LoteListBinding(),
    ),
    GetPage(
      name: _Paths.LOTE_ADD,
      page: () => const LoteAddView(),
      binding: LoteAddBinding(),
    ),
  ];
}
