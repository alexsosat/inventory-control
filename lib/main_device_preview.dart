import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/data/providers/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDBService().initDB();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => InventoryControlApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        locale: (context) => DevicePreview.locale(context),
      ),
    ),
  );
}
