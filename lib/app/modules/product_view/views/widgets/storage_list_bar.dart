import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../../../constants/theme.dart';
import '../../../../../constants/values.dart';
import '../../../../data/models/storages/storage.dart';
import '../../controllers/product_view_controller.dart';

class StorageListBar extends StatefulWidget {
  final List<Storage> storages;

  const StorageListBar(
    this.storages, {
    super.key,
  });

  @override
  State<StorageListBar> createState() => _StorageListBarState();
}

class _StorageListBarState extends State<StorageListBar> {
  late ProductViewController _controller;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = Get.find<ProductViewController>();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(
          () => Container(
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: AppValues.kRoundedMedium,
            ),
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: widget.storages
                  .map(
                    (storage) => _StorageSelectButton(
                      storage,
                      isSelected: _controller.storageIndex.value ==
                          widget.storages.indexOf(storage),
                      selectedColor:
                          colorFromHex(_controller.product.hexColor) ??
                              AppTheme.blue,
                      onIndexSelected: () {
                        _controller.storageIndex(
                          widget.storages.indexOf(storage),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        if (widget.storages.length > 3)
          IconButton(
            onPressed: () => _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            icon: const Icon(Icons.chevron_right_rounded),
          ),
      ],
    );
  }
}

class _StorageSelectButton extends StatelessWidget {
  final Storage storage;
  final void Function() onIndexSelected;
  final Color selectedColor;
  final bool isSelected;

  const _StorageSelectButton(
    this.storage, {
    required this.onIndexSelected,
    this.selectedColor = AppTheme.blue,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor:
            isSelected ? selectedColor.withOpacity(0.2) : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      onPressed: onIndexSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            Icon(
              Icons.warehouse_rounded,
              color: isSelected ? selectedColor : Colors.grey,
            ),
            const SizedBox(height: 10),
            Text(
              storage.name,
              style: Get.textTheme.bodyMedium?.copyWith(
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
