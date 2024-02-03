// Package imports:
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/commons/routes/route.dart';
import 'package:suiniji/src/commons/widgets/webviews/default_webview.dart';
import 'package:suiniji/src/features/home/presentation/home_page.dart';
import 'package:suiniji/src/features/login/presentation/login_page.dart';
import 'package:suiniji/src/features/rift/presentation/rift_page.dart';
import 'package:suiniji/src/features/setting/presentation/setting_page.dart';

part 'app_router.g.dart';

class Routes {
  final login = Route('login', (context, state) => const LoginPage());
  final home = Route('home', (context, state) => const HomePage());
  final setting = Route('setting', (context, state) => const SettingPage());
  final rift = Route('rift', (context, state) => const RiftPage());

  final webview = Route('webview', (context, state) {
    final title = state.uri.queryParameters['title'] ?? '';
    final link = state.uri.queryParameters['link'] ?? '';
    return CommonDefaultWebview(
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

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: routes.root,
    errorBuilder: routes.home.builder,
    redirect: (context, state) {
      return null;
    },
    routes: routes.routes,
  );
}
