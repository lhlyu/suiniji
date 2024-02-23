// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final loginRoute = GoRoute(
  path: 'login',
  name: 'login',
  builder: (context, state) {
    return const LoginPage();
  },
);
