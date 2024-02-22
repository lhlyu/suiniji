// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suiniji/src/commons/log/log.dart';

// Project imports:
import 'package:suiniji/src/pages/index.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static final login = GoRoute(path: 'login', name: 'login', builder: (context, state) => const LoginPage());
  static final creation =
      GoRoute(path: 'creation', name: 'creation', builder: (context, state) => const CreationPage());
  static final webview = GoRoute(
    path: 'webview',
    name: 'webview',
    builder: (context, state) {
      String? title = state.uri.queryParameters['title'] ?? '';
      String? link = state.uri.queryParameters['link'] ?? '';
      return WebviewPage(title: title, link: link);
    },
  );
  static final rift = GoRoute(path: 'rift', name: 'rift', builder: (context, state) => const RiftPage());

  static List<RouteBase> get routes {
    return [
      login,
      creation,
      webview,
      rift,
    ];
  }

  static String get initialLocation {
    return '/';
  }

  static Widget Function(BuildContext, GoRouterState)? get errorBuilder {
    return login.builder;
  }
}

/// 路由为什么要用riverpod
/// 因为需要使用auth状态判断是否登录
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: Routes.initialLocation,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
        routes: Routes.routes,
      ),
    ],
    errorBuilder: Routes.errorBuilder,
  );
}
