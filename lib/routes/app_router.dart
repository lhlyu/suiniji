import 'package:flutter_template/views/home/page.dart';
import 'package:flutter_template/views/login/page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter();

  static final Route routeLogin = Route('login');
  static final Route routeHome = Route('');
  static final Route routePermission = Route('permission');
  static final Route routeUpgrade = Route('upgrade');
  static final Route routeAbout = Route('about');

  GoRouter get router => GoRouter(
        initialLocation: routeHome.absolutePath,
        errorBuilder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: routeLogin.absolutePath,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: routeHome.absolutePath,
            redirect: (context, state) {
              // TODO: 这里作为路由守卫，没有登录则跳转到login
              if (false) {
                return routeLogin.absolutePath;
              }
              return routeHome.absolutePath;
            },
            builder: (context, state) => const HomePage(),
            // routes: [
            //   GoRoute(
            //     path: routePermission.path,
            //     builder: (context, state) => const PermissionPage(),
            //   ),
            //   GoRoute(
            //     path: routeUpgrade.path,
            //     builder: (context, state) => const UpgradePage(),
            //   ),
            //   GoRoute(
            //     path: routeAbout.path,
            //     builder: (context, state) => const AboutPage(),
            //   ),
            // ],
          ),
        ],
      );
}

class Route {
  String path;

  Route(this.path);

  @override
  String toString() => path;

  String get absolutePath => '/$path';
}
