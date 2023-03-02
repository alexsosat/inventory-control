import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inventory_control/app/modules/lote_view/views/widgets/lote_info.dart';
import 'widgets/lote_bottom_actions.dart';

import '../controllers/lote_view_controller.dart';

class LoteViewView extends GetView<LoteViewController> {
  const LoteViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.lote.product.value!.name),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: LoteInfo(controller.lote),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: LoteBottomActions(),
          ),
        ],
      ),
    );
  }
}
