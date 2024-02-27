// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/routes/animation.dart';
import './page.dart';

final vpasswordRoute = GoRoute(
  path: 'vpassword',
  name: 'vpassword',
  pageBuilder: (context, state) => RouterTransitionFactory.slide(
    context,
    state,
    const VPasswordPage(),
  ),
);
