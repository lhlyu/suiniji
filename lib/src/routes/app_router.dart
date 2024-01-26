import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suiniji/src/features/login/presentation/login_page.dart';
import 'package:suiniji/src/features/home/presentation/home_page.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  const String rootPath = '/';
  final Route routeLogin = Route('login', (context, state) => const LoginPage());
  final Route routeHome = Route('home', (context, state) => const HomePage());

  return GoRouter(
    initialLocation: rootPath,
    errorBuilder: routeHome.builder,
    routes: [
      GoRoute(
        path: rootPath,
        redirect: (context, state) {
          var isLogin = false;
          // ignore: dead_code
          if (isLogin) {
            return routeHome.absolutePath;
          }
          return routeLogin.absolutePath;
        },
        routes: [
          GoRoute(
            path: routeLogin.path,
            builder: routeLogin.builder,
          ),
          GoRoute(
            path: routeHome.path,
            builder: routeHome.builder,
          ),
        ],
      )
    ],
  );
}

class Route {
  String path;

  Widget Function(
    BuildContext context,
    GoRouterState state,
  ) builder;

  Route(this.path, this.builder);

  @override
  String toString() => path;

  String get absolutePath => '/$path';
}
