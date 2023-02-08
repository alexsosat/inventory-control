import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../../constants/theme.dart';
import '../controllers/home_controller.dart';
import 'sections/staggered_glance_section.dart';
import 'sections/storage_list_section.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: false,
        actions: [
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
          ),
          SpeedDialChild(
            child: const Icon(Icons.inventory_rounded),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Añadir Producto',
          ),
        ],
      ),
    );
  }
}
