import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suiniji/src/app/injection_container.dart';

part 'controlle.g.dart';

@Riverpod(keepAlive: true)
class StartupController extends _$StartupController {
  @override
  Future<void> build() async {
    /// 销毁时需要处理的东西
    ref.onDispose(() {});

    final delay = Future.delayed(const Duration(seconds: 1));

    /// 这里写需要初始化的任务
    await Future.wait([
      setup(),
      delay,
    ]);
  }
}
