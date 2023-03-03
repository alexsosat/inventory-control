import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_list/controllers/lote_list_controller.dart';
import 'filter_dialog.dart';

import '../../../../../global/form/search_field.dart';

class LoteSearchSection extends StatefulWidget {
  final Color? storageColor;
  const LoteSearchSection({
    required this.storageColor,
    super.key,
  });

  @override
  State<LoteSearchSection> createState() => _LoteSearchSectionState();
}

class _LoteSearchSectionState extends State<LoteSearchSection> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SearchField(
              controller: _searchController,
              label: "Buscador",
              onChanged: (value) =>
                  Get.find<LoteListController>().searchText(value),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => Get.dialog(
              LoteFilterDialog(
                storageColor: widget.storageColor,
              ),
            ),
            icon: const Icon(
              Icons.filter_alt_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
