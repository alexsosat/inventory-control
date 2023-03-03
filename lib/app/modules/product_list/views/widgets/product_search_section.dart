import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/buttons/group_buttons/tag_buttons.dart';
import '../../../../../global/form/search_field.dart';
import '../../controllers/product_list_controller.dart';

class ProductSearchSection extends StatefulWidget {
  final Color? storageColor;
  const ProductSearchSection({
    required this.storageColor,
    super.key,
  });

  @override
  State<ProductSearchSection> createState() => _ProductSearchSectionState();
}

class _ProductSearchSectionState extends State<ProductSearchSection> {
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchField(
            controller: _searchController,
            label: "Buscador",
            onChanged: (value) =>
                Get.find<ProductListController>().searchText(value),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                TagFilterSection(
                  onTypeChanged: (value, isSelected) {
                    if (isSelected) {
                      Get.find<ProductListController>().addTag(value);
                    } else {
                      Get.find<ProductListController>().removeTag(value);
                    }
                  },
                  selectedTagColor: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
