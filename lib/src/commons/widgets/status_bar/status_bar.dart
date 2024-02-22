// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 状态栏样式
class CommonStatusBar extends StatelessWidget {
  final Widget child;

  const CommonStatusBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // 根据当前主题亮度，动态设置状态栏样式
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return MediaQuery(
      // 保证文字大小不受手机系统设置影响
      data: MediaQuery.of(context).copyWith(
        textScaler: TextScaler.noScaling,
      ),
      child: child,
    );
  }
}
