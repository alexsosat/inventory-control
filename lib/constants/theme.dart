import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color blue = Color(0xff171ECA);
  static const Color yellow = Color(0xff8C8E00);
  static const Color red = Color(0xffFF0000);
  static const Color green = Color(0xff23B100);

  static ThemeData get lightTheme => FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xff171ECA),
          primaryContainer: Color(0xff9DE2FF),
          secondary: Color(0xff8C8E00),
          secondaryContainer: Color(0xffFFFB9D),
          tertiary: Color(0xff23B100),
          tertiaryContainer: Color(0xff9DFFA7),
          appBarColor: Colors.transparent,
          error: Color(0xffFF0000),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
      );

  static ThemeData get darkTheme => FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xff171ECA),
          primaryContainer: Color(0xff9DE2FF),
          secondary: Color(0xff8C8E00),
          secondaryContainer: Color(0xffFFFB9D),
          tertiary: Color(0xff23B100),
          tertiaryContainer: Color(0xff9DFFA7),
          appBarColor: Colors.transparent,
          error: Color(0xffFF0000),
        ),
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily,
      );
}
