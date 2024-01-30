import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      splashColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.lightBlue[100],
        selectionHandleColor: Colors.lightBlue[400],
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      splashColor: Colors.white,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colors.lightBlue[600],
        selectionHandleColor: Colors.lightBlue,
      ),
    );
  }
}
