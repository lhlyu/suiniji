// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final registerRoute = GoRoute(
  path: 'register',
  name: 'register',
  builder: (context, state) {
    return const RegisterPage();
  },
);
