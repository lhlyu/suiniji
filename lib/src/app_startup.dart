// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/app.dart';
import 'package:suiniji/src/app_error.dart';
import 'package:suiniji/src/app_loading.dart';
import 'package:suiniji/src/injection_container.dart';

part 'app_startup.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  /// 销毁时需要处理的东西
  ref.onDispose(() {});

  final delay = Future.delayed(const Duration(seconds: 0));

  /// 这里写需要初始化的任务
  await Future.wait([
    setup(),
    delay,
  ]);
}

/// app启动后根据不同的情况去展示ui
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => const App(),
      loading: () => const AppStartupLoading(),
      error: (e, st) => AppStartupError(
        message: e.toString(),

        /// 重新加载
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
    );
  }
}
