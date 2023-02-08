import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/data/providers/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDBService().initDB();

  runApp(
    const InventoryControlApp(),
  );
}
