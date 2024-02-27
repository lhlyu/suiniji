// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/routes/animation.dart';
import './page.dart';

final webviewRoute = GoRoute(
  path: 'webview',
  name: 'webview',
  pageBuilder: (context, state) {
    String? title = state.uri.queryParameters['title'] ?? '';
    String? link = state.uri.queryParameters['link'] ?? '';
    return RouterTransitionFactory.slide(
      context,
      state,
      WebviewPage(title: title, link: link),
    );
  },
);
