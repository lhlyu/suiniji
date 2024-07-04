// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final profileRoute = GoRoute(
  path: 'profile',
  name: 'profile',
  pageBuilder: (context, state) {
    return const NoTransitionPage(child: ProfilePage());
  },
);
