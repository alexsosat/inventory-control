import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../constants/theme.dart';
import '../../../../data/models/lote/lote.dart';
import '../../../../routes/app_pages.dart';
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
              onTap: () => Get.toNamed(Routes.PRODUCT_LIST),
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
              onTap: () => Get.toNamed(
                Routes.LOTE_LIST,
                arguments: {
                  'title': 'Lotes Caducados',
                  'loteStatus': LoteStatus.expired,
                },
              ),
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
              onTap: () => Get.toNamed(
                Routes.LOTE_LIST,
                arguments: {
                  'title': 'Lotes En Buen Estado',
                  'loteStatus': LoteStatus.good,
                },
              ),
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
              onTap: () => Get.toNamed(
                Routes.LOTE_LIST,
                arguments: {
                  'title': 'Lotes Por Caducar',
                  'loteStatus': LoteStatus.toExpire,
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
