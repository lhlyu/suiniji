// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/pages/index.dart';

part 'app_router.g.dart';

class Routes {
  static final login = loginRoute;
  static final creation = creationRoute;
  static final webview = webviewRoute;
  static final about = aboutRoute;
  static final register = registerRoute;
  static final vchaptcha = vcaptchaRoute;
  static final vpassword = vpasswordRoute;

  static final RouteObserver<PageRoute> routeObserver = RouteObserver();

  static List<RouteBase> get routes {
    return [
      login,
      creation,
      webview,
      about,
      register,
      vchaptcha,
      vpassword,
    ];
  }

  static String get initialLocation {
    return '/';
  }

  static Widget Function(BuildContext, GoRouterState)? get defaultBuilder {
    return login.builder;
  }
}

/// 路由为什么要用riverpod
/// 因为需要使用auth状态判断是否登录
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.initialLocation,
    debugLogDiagnostics: kDebugMode,
    observers: [Routes.routeObserver],
    routes: [
      GoRoute(
        path: '/',
        builder: Routes.defaultBuilder,
        routes: Routes.routes,
      ),
    ],
    errorBuilder: Routes.defaultBuilder,
  );
}

/// 给go_router扩展一个方法，跳转并清空历史栈
extension GoRouterBuildContextExtension on BuildContext {
  void pushReplacementNamedAndClearHistory(String name) {
    while (GoRouter.of(this).canPop()) {
      GoRouter.of(this).pop();
    }
    GoRouter.of(this).pushReplacementNamed(name);
  }
}
