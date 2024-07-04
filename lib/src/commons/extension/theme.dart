// Flutter imports:
import 'package:flutter/material.dart';

extension AppThemeBuildContextExtension on BuildContext {
  /// 是否是暗色模式
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  DividerThemeData get dividerTheme {
    return Theme.of(this).dividerTheme;
  }
}

extension AppThemeTextStyleExtension on TextStyle {
  TextStyle? bold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
  }) {
    return copyWith(
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
    );
  }

  TextStyle? withOpacity(double opacity) {
    return copyWith(
      color: color?.withOpacity(opacity),
    );
  }
}
