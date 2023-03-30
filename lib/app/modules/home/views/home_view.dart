import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../barcode_scanner/controllers/barcode_scanner_controller.dart';

import '../../../routes/app_pages.dart';
import 'sections/staggered_glance_section.dart';
import 'sections/storage_list_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Get.find<BarcodeScannerController>().searchLotes(),
            icon: const FaIcon(FontAwesomeIcons.barcode, size: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              StaggeredGlanceSection(),
              SizedBox(height: 60),
              StorageListSection(),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 20,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.warehouse_rounded),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            label: 'Añadir Bodega',
            onTap: () => Get.toNamed(Routes.STORAGE_ADD),
          ),
          SpeedDialChild(
            child: const Icon(Icons.inventory_rounded),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Añadir Producto',
            onTap: () => Get.toNamed(Routes.PRODUCT_ADD),
          ),
        ],
      ),
    );
  }
}
