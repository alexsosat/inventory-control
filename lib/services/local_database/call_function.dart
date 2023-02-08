import 'package:get/route_manager.dart';

import '../../global/overlays/dialog/dialog.dart';
import '../../global/overlays/loading_dialog.dart';

databaseCallHandler<K>({
  required Future<K> Function() httpCall,
  required void Function(K) onSuccess,
  required void Function(Object) onError,
}) async {
  try {
    K res = await httpCall();
    onSuccess(res);
  } catch (e) {
    onError(e);
  }
}

Future<bool> baseActionCall<K>({
  required Future<K> Function() call,
  String loadingText = "Cargando",
  bool showLoadingDialog = true,
  Function(K)? onSuccess,
  Function()? onError,
}) async {
  bool success = false;
  if (showLoadingDialog) {
    openLoadingDialog(loadingText);
  }
  await databaseCallHandler<K>(
    httpCall: () async => call(),
    onSuccess: (data) {
      success = true;
      if (showLoadingDialog) {
        Get.back();
      }
      if (onSuccess != null) {
        onSuccess(data);
      }
    },
    onError: (e) async {
      if (showLoadingDialog) {
        Get.back();
      }

      displayErrorDialog(
        e.toString(),
        onConfirm: onError,
      );
    },
  );

  return success;
}
