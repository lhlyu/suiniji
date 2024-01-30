import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:suiniji/src/features/login/presentation/login_page.dart';
import 'package:suiniji/src/features/home/presentation/home_page.dart';
import 'package:suiniji/src/features/setting/presentation/setting_page.dart';
import 'package:suiniji/src/routes/route.dart';
import 'package:suiniji/src/widgets/webviews/default_webview.dart';

part 'app_router.g.dart';

class Routes {
  final login = Route('login', (context, state) => const LoginPage());
  final home = Route('home', (context, state) => const HomePage());
  final setting = Route('setting', (context, state) => const SettingPage());
  final webview = Route('webview', (context, state) {
    final title = state.uri.queryParameters['title'] ?? '';
    final link = state.uri.queryParameters['link'] ?? '';
    return DefaultWebview(
      title: title,
      link: link,
    );
  });

  String get root => '/login';

  List<RouteBase> get routes {
    return [
      login.getGoRoute,
      home.getGoRoute,
      setting.getGoRoute,
      webview.getGoRoute,
    ];
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
