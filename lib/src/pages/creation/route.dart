// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final creationRoute = GoRoute(
  path: 'creation',
  name: 'creation',
  builder: (context, state) {
    return const CreationPage();
  },
);
