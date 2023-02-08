import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../../../constants/theme.dart';
import '../../../../../global/overlays/dialog/dialog.dart';
import '../../controllers/home_controller.dart';
import '../widgets/glance_card.dart';

class StaggeredGlanceSection extends GetView<HomeController> {
  const StaggeredGlanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => StaggeredGrid.count(
        crossAxisCount: 6,
        mainAxisSpacing: 20,
        crossAxisSpacing: 30,
        axisDirection: AxisDirection.down,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 4,
            child: GlanceCard(
              title: 'Productos Registrados',
              value: controller.registeredProducts.toString(),
              icon: Icons.inventory_rounded,
              color: AppTheme.blue,
              onTap: () => openDialogWindow(
                title: "Prueba",
                message: "Prueba",
                type: DialogType.info,
                onCancel: () {},
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: GlanceCard(
              title: 'Lotes Caducados',
              value: controller.expiredLotes.toString(),
              icon: Icons.delete_outline_rounded,
              color: AppTheme.red,
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: GlanceCard(
              title: 'Lotes En Buen Estado',
              value: controller.goodLotes.toString(),
              icon: Icons.check,
              color: AppTheme.green,
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 3,
            child: GlanceCard(
              title: 'Lotes Por Caducar',
              value: controller.closeToExpireLotes.toString(),
              icon: Icons.calendar_month,
              color: AppTheme.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
