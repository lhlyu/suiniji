// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/routes/animation.dart';
import 'page.dart';

final aboutRoute = GoRoute(
  path: 'about',
  name: 'about',
  pageBuilder: (context, state) => RouterTransitionFactory.slide(
    context,
    state,
    const AboutPage(),
  ),
);
