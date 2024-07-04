// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/app/app.dart';
import 'package:suiniji/src/app/app_error.dart';
import 'package:suiniji/src/app/app_loading.dart';
import 'package:suiniji/src/app/controlle.dart';

/// app启动后根据不同的情况去展示ui
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(startupControllerProvider);
    return appStartupState.when(
      data: (_) => const App(),
      loading: () => const AppLoading(),
      error: (e, st) => AppError(
        message: e.toString(),

        /// 重新加载
        onRetry: () => ref.invalidate(startupControllerProvider),
      ),
    );
  }
}
