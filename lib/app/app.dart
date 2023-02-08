import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';

import '../constants/theme.dart';
import 'routes/app_pages.dart';

class InventoryControlApp extends StatelessWidget {
  final bool useInheritedMediaQuery;
  final Widget Function(BuildContext, Widget?)? builder;
  final Locale? Function(BuildContext)? locale;

  const InventoryControlApp({
    this.useInheritedMediaQuery = false,
    this.builder,
    this.locale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Inventory Control",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      useInheritedMediaQuery: useInheritedMediaQuery,

      // Set the theme for the application
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      //Localizations
      locale: locale?.call(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      builder: builder ??
          (BuildContext context, Widget? child) {
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
