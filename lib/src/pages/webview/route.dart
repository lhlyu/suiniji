// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final webviewRoute = GoRoute(
  path: 'webview',
  name: 'webview',
  builder: (context, state) {
    String? title = state.uri.queryParameters['title'] ?? '';
    String? link = state.uri.queryParameters['link'] ?? '';
    return WebviewPage(title: title, link: link);
  },
);
