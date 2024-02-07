// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oktoast/oktoast.dart';

// Project imports:
import 'package:suiniji/src/app.dart';
import 'package:suiniji/src/app_startup.dart';

void main() async {
  /// 这行代码的作用是确保 Flutter 的 widget 绑定已经初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// 滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;

  /// 查看哪些部件重绘了
  // debugRepaintRainbowEnabled = true;

  /// 异常处理
  registerErrorHandlers();

  runApp(
    ProviderScope(
      child: DevicePreview(
        enabled: kIsWeb && kDebugMode,
        builder: (context) => OKToast(
          textPadding: const EdgeInsets.only(
            left: 14,
            right: 14,
            top: 8,
            bottom: 8,
          ),
          child: AppStartupWidget(
            onLoaded: (context) => const App(),
          ),
        ),
      ),
    ),
  );
}

void registerErrorHandlers() {
  /// 如果发生任何未捕获的异常，则显示一些错误UI
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };

  /// 处理来自底层平台/OS的错误
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };

  /// 当应用程序中的任何小部件无法构建时显示一些错误UI
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('发生了一些小意外'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
