import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../constants/theme.dart';
import '../widgets/glance_card.dart';

class StaggeredGlanceSection extends StatelessWidget {
  const StaggeredGlanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 6,
      mainAxisSpacing: 20,
      crossAxisSpacing: 30,
      axisDirection: AxisDirection.down,
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 4,
          child: GlanceCard(
            title: 'Productos Registrados',
            value: '2000',
            icon: Icons.inventory_rounded,
            color: AppTheme.blue,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 3,
          child: GlanceCard(
            title: 'Lotes Caducados',
            value: '35',
            icon: Icons.delete_outline_rounded,
            color: AppTheme.red,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 3,
          child: GlanceCard(
            title: 'Lotes En Buen Estado',
            value: '1250',
            icon: Icons.check,
            color: AppTheme.green,
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 3,
          child: GlanceCard(
            title: 'Lotes Por Caducar',
            value: '200',
            icon: Icons.calendar_month,
            color: AppTheme.yellow,
          ),
        ),
      ],
    );
  }
}
