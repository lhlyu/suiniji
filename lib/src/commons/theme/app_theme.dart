// Flutter imports:
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const scheme = ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xff3867d6), // 亮色主题的主色变体
      secondary: Color(0xff50fa7b), // 亮色主题的次要颜色变体
      surface: Colors.transparent, // 表面色
      background: Colors.white,
      error: Color(0xffFF5555), // 错误色
      onPrimary: Colors.black, // 主色上的文本颜色
      onSecondary: Colors.black, // 次色上的文本颜色
      onSurface: Color(0xff282a36), // 深色文本，对比亮色表面
      onBackground: Color(0xff282a36), // 背景上的文本颜色
      onError: Colors.white, // 错误色上的文本颜色
    );

    return ThemeData(
      colorScheme: scheme,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  static ThemeData get darkTheme {
    const scheme = ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color(0xff4b7bec), // 淡蓝色，可以作为变体颜色使用
      secondary: Color(0xffff79c6), // 次要变体，较深的灰色
      surface: Color(0xff282a36), // 表面色，如卡片背景
      background: Color(0xff282a36), // 背景色
      error: Color(0xffFF5555), // 错误色
      onPrimary: Colors.white, // 主要颜色上的文本或图标颜色
      onSecondary: Colors.black, // 次要颜色上的文本或图标颜色
      onSurface: Color(0xfff8f8f2), // 表面上的文本或图标颜色
      onBackground: Color(0xfff8f8f2), // 背景上的文本或图标颜色
      onError: Colors.white, // 错误色上的文本或图标颜色
    );

    return ThemeData(
      colorScheme: scheme,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
