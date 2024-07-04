// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/commons/layouts/home/layout.dart';
import 'package:suiniji/src/pages/index.dart';

part 'app_router.g.dart';

class Routes {
  static final login = loginRoute;
  static final creation = creationRoute;
  static final webview = webviewRoute;
  static final about = aboutRoute;
  static final upassword = upasswordRoute;
  static final vchaptcha = vcaptchaRoute;
  static final vpassword = vpasswordRoute;
  static final note = noteRoute;
  static final profile = profileRoute;

  static final RouteObserver<PageRoute> routeObserver = RouteObserver();

  static List<RouteBase> get routes {
    return [
      login,
      webview,
      about,
      upassword,
      vchaptcha,
      vpassword,
      ShellRoute(
        builder: (context, state, child) {
          return HomeLayout(child: child);
        },
        routes: [
          note,
          creation,
          profile,
        ],
      ),
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
