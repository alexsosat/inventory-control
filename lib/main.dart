import 'package:flutter/material.dart';

import 'app/app.dart';
import 'services/local_database/local_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDBService().initDB();

  runApp(
    const InventoryControlApp(),
  );
}
