import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suiniji/src/app_error.dart';
import 'package:suiniji/src/app_loading.dart';

part 'app_startup.g.dart';

@riverpod
Future<void> appStartup(AppStartupRef ref) async {
  /// 销毁时需要处理的东西
  ref.onDispose(() {});

  // var delay = Future.delayed(const Duration(seconds: 2));

  /// 这里写需要初始化的任务
  await Future.wait([]);
}

/// app启动后根据不同的情况去展示ui
class AppStartupWidget extends ConsumerWidget {
  final WidgetBuilder onLoaded;

  const AppStartupWidget({
    super.key,
    required this.onLoaded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      data: (_) => onLoaded(context),
      loading: () => const AppStartupLoading(),
      error: (e, st) => AppStartupError(
        message: e.toString(),
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
    );
  }
}
