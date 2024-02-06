// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/commons/log/log.dart';
import 'package:suiniji/src/pages/home/home_page.dart';
import 'package:suiniji/src/pages/login/login_page.dart';
import 'package:suiniji/src/pages/rift/rift_page.dart';
import 'package:suiniji/src/pages/setting/setting_page.dart';
import 'package:suiniji/src/pages/webview/webview_page.dart';
import 'package:suiniji/src/routes/route.dart';

part 'app_router.g.dart';

class Routes {
  final login = Route('login', (context, state) => const LoginPage());
  final home = Route('home', (context, state) => const HomePage());
  final setting = Route('setting', (context, state) => const SettingPage());
  final rift = Route('rift', (context, state) => const RiftPage());

  final webview = Route('webview', (context, state) {
    final title = state.uri.queryParameters['title'] ?? '';
    final link = state.uri.queryParameters['link'] ?? '';
    logger.i('$title, $link');
    return WebviewPage(
      title: title,
      link: link,
    );
  });

  String get root => '/login';

  List<RouteBase> get routes {
    final rs = [
      login,
      home,
      setting,
      rift,
      webview,
    ];
    return rs.map((e) => e.getGoRoute).toList();
  }
}

final routes = Routes();

@Riverpod()
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: routes.root,
    errorBuilder: routes.home.builder,
    redirect: (context, state) {
      logger.d("路由 -> ${state.uri}");

      return null;
    },
    routes: routes.routes,
  );
}
