// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/routes/animation.dart';
import './page.dart';

final registerRoute = GoRoute(
  path: 'register',
  name: 'register',
  pageBuilder: (context, state) => RouterTransitionFactory.slide(
    context,
    state,
    const RegisterPage(),
  ),
);
