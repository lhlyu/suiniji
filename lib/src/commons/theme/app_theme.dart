// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/page_transitions.dart';

const boldTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

class AppTheme {
  static Color primaryColor = const Color(0xff3b82f6);
  static Color successColor = const Color(0xff10b981);
  static Color warningColor = const Color(0xfff97316);
  static Color errorColor = const Color(0xffdc2626);

  static ThemeData get lightTheme {
    return ThemeData(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        onPrimary: Colors.white,
        background: Colors.white,
        onBackground: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade200,
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData get dartTheme {
    return ThemeData(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        onPrimary: Colors.white,
        background: Color(0xff282a36),
        onBackground: Color(0xfff8f8f2),
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xff44475a),
        thickness: 1,
        space: 1,
      ),
    );
  }
}
