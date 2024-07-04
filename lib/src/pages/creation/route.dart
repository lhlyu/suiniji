// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final creationRoute = GoRoute(
  path: 'creation',
  name: 'creation',
  pageBuilder: (context, state) {
    return const NoTransitionPage(child: CreationPage());
  },
);
