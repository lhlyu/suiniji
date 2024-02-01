import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const primaryColor = Colors.blue;

    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      splashColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: primaryColor[100],
        selectionHandleColor: primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    const primaryColor = Colors.lightBlue;

    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      splashColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: primaryColor[600],
        selectionHandleColor: primaryColor,
      ),
    );
  }
}
