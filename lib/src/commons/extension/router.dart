// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

/// 给go_router扩展一个方法，跳转并清空历史栈
extension GoRouterBuildContextExtension on BuildContext {
  void pushReplacementNamedAndClearHistory(String name) {
    while (GoRouter.of(this).canPop()) {
      GoRouter.of(this).pop();
    }
    GoRouter.of(this).pushReplacementNamed(name);
  }
}
