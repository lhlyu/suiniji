// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oktoast/oktoast.dart';

// Project imports:
import 'package:suiniji/src/app_startup.dart';
import 'package:suiniji/src/commons/utils/handle_error.dart';

Future<void> main() async {
  handleError(() async {
    /// 这行代码的作用是确保 Flutter 的 widget 绑定已经初始化
    WidgetsFlutterBinding.ensureInitialized();

    /// 滚动性能优化 1.22.0
    GestureBinding.instance.resamplingEnabled = true;

    /// 查看哪些部件重绘了
    // debugRepaintRainbowEnabled = true;

    runApp(
      ProviderScope(
        child: DevicePreview(
          enabled: kIsWeb && kDebugMode,
          builder: (context) => const OKToast(
            textPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: AppStartupWidget(),
          ),
        ),
      ),
    );
  });
}
