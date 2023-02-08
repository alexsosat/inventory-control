import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/storage_add/bindings/storage_add_binding.dart';
import '../modules/storage_add/views/storage_add_view.dart';

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
  ];
}
