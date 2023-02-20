import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../app/data/models/lote/lote.dart';
import '../../../constants/values.dart';

class LoteStateFilterSection extends StatefulWidget {
  final Function(LoteStatus status, bool isSelected) onTypeChanged;
  final Color selectedTagColor;

  const LoteStateFilterSection({
    super.key,
    required this.onTypeChanged,
    required this.selectedTagColor,
  });

  @override
  State<LoteStateFilterSection> createState() => _LoteStateFilterSectionState();
}

class _LoteStateFilterSectionState extends State<LoteStateFilterSection> {
  final controller = GroupButtonController();

  final _loteStatusFilters = [
    _LoteStatusFilter(
      LoteStatus.good,
      'Buenos',
    ),
    _LoteStatusFilter(
      LoteStatus.toExpire,
      'Por Expirar',
    ),
    _LoteStatusFilter(
      LoteStatus.expired,
      'Expirados',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          GroupButton<_LoteStatusFilter>(
            controller: controller,
            buttons: _loteStatusFilters,
            enableDeselect: true,
            isRadio: false,
            onSelected: (value, index, isSelected) => widget.onTypeChanged(
              value.status,
              isSelected,
            ),
            buttonBuilder: (selected, filter, context) => Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: AppValues.kRoundedMax,
                color: selected ? widget.selectedTagColor : Colors.grey[300],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    filter.name,
                    style: TextStyle(
                      color: selected ? Colors.white : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoteStatusFilter {
  final LoteStatus status;
  final String name;

  _LoteStatusFilter(this.status, this.name);
}
