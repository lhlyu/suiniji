// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final vpasswordRoute = GoRoute(
  path: 'vpassword',
  name: 'vpassword',
  builder: (context, state) {
    return const VPasswordPage();
  },
);
