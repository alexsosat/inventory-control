import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'app/data/providers/local_db.dart';

import 'app/routes/app_pages.dart';
import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalDBService().initDB();

  runApp(
    const _InventoryControlApp(),
  );
}

class _InventoryControlApp extends StatelessWidget {
  const _InventoryControlApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Inventory Control",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // Set the theme for the application
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      //Localizations
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      builder: (BuildContext context, Widget? child) {
        Intl.defaultLocale = Localizations.localeOf(context).languageCode;

        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: MediaQuery.of(context).textScaleFactor.clamp(
                  1.0,
                  1.5,
                ),
          ),
          child: child!,
        );
      },
    );
  }
}
