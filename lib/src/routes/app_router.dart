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
  static final rift = riftRoute;
  static final register = registerRoute;
  static final vchaptcha = vcaptchaRoute;
  static final vpassword = vpasswordRoute;

  static List<RouteBase> get routes {
    return [
      login,
      creation,
      webview,
      rift,
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
