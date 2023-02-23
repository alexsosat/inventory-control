import 'package:get/get.dart';

import '../../../data/models/product_presentation/product_presentation.dart';
import '../../../data/providers/product_presentations_provider.dart';

class ProductPresentationListController extends GetxController
    with StateMixin<List<ProductPresentation>> {
  final _provider = ProductPresentationProvider();

  List<ProductPresentation> selectedPresentations = List.empty(growable: true);

  @override
  void onInit() {
    loadPresentations();
    super.onInit();
  }

  loadPresentations() async {
    change(null, status: RxStatus.loading());
    try {
      final presentations = await _provider.getAllPresentations();

      presentations.isNotEmpty
          ? change(presentations, status: RxStatus.success())
          : change(null, status: RxStatus.empty());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
