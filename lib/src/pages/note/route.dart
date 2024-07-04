// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final noteRoute = GoRoute(
  path: 'note',
  name: 'note',
  pageBuilder: (context, state) {
    return const NoTransitionPage(child: NotePage());
  },
);
