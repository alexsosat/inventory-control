import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color blue = Color(0xff171ECA);
  static const Color yellow = Color(0xff8C8E00);
  static const Color red = Color(0xffFF0000);
  static const Color green = Color(0xff23B100);

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF3E47E5),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFE0E0FF),
          onPrimaryContainer: Color(0xFF00016D),
          secondary: Color(0xFF616200),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFE7E962),
          onSecondaryContainer: Color(0xFF1C1D00),
          tertiary: Color(0xFFC00100),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFDAD4),
          onTertiaryContainer: Color(0xFF410000),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          background: Color(0xFFF5F5F5),
          onBackground: Color(0xFF001F25),
          surface: Color(0xFFF8FDFF),
          onSurface: Color(0xFF001F25),
          surfaceVariant: Color(0xFFE4E1EC),
          onSurfaceVariant: Color(0xFF46464F),
          outline: Color(0xFF777680),
          onInverseSurface: Color(0xFFD6F6FF),
          inverseSurface: Color(0xFF00363F),
          inversePrimary: Color(0xFFBEC2FF),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF3E47E5),
          outlineVariant: Color(0xFFC7C5D0),
          scrim: Color(0xFF000000),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        cardColor: const Color(0xFF1F1F1F),
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFBEC2FF),
          onPrimary: Color(0xFF0002AB),
          primaryContainer: Color(0xFF1F27CE),
          onPrimaryContainer: Color(0xFFE0E0FF),
          secondary: Color(0xFFCBCD49),
          onSecondary: Color(0xFF323200),
          secondaryContainer: Color(0xFF484A00),
          onSecondaryContainer: Color(0xFFE7E962),
          tertiary: Color(0xFFFFB4A8),
          onTertiary: Color(0xFF690100),
          tertiaryContainer: Color(0xFF930100),
          onTertiaryContainer: Color(0xFFFFDAD4),
          error: Color(0xFFFFB4AB),
          errorContainer: Color(0xFF93000A),
          onError: Color(0xFF690005),
          onErrorContainer: Color(0xFFFFDAD6),
          background: Color(0xFF001F25),
          onBackground: Color(0xFFA6EEFF),
          surface: Color(0xFF001F25),
          onSurface: Color(0xFFA6EEFF),
          surfaceVariant: Color(0xFF46464F),
          onSurfaceVariant: Color(0xFFC7C5D0),
          outline: Color(0xFF91909A),
          onInverseSurface: Color(0xFF001F25),
          inverseSurface: Color(0xFFA6EEFF),
          inversePrimary: Color(0xFF3E47E5),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFFBEC2FF),
          outlineVariant: Color(0xFF46464F),
          scrim: Color(0xFF000000),
        ),
      );
}
