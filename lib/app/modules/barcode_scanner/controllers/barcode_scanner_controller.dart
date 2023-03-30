import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import '../../../../global/overlays/snackbar.dart';
import '../../../data/models/lote/lote.dart';
import '../../../data/providers/lote_provider.dart';
import '../../../routes/app_pages.dart';
import '../widgets/barcode_dialog_list.dart';

class BarcodeScannerController extends GetxController {
  final _provider = LoteProvider();

  Future<String?> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        "Cancelar",
        true,
        ScanMode.BARCODE,
      );

      if (barcodeScanRes.isEmpty) {
        snackbarMessage(
          title: 'No se escaneó ningún código de barras',
        );
        return null;
      }

      return barcodeScanRes;
    } catch (e) {
      snackbarMessage(
        title: 'No se escaneó ningún código de barras',
      );
      return null;
    }
  }

  Future<List<Lote>?> searchLotes() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        "Cancelar",
        true,
        ScanMode.BARCODE,
      );
      List<Lote> lotes = await _provider.getLotesByLoteUID(barcodeScanRes);
      if (lotes.isEmpty) {
        snackbarMessage(
          title: 'No se encontraron lotes con el código de barras escaneado',
        );
      } else if (lotes.length == 1) {
        Get.toNamed(Routes.LOTE_VIEW, arguments: lotes.first);
      } else {
        Get.dialog(BarcodeScanResultDialog(lotes: lotes));
      }

      return lotes;
    } catch (e) {
      return null;
    }
  }
}
