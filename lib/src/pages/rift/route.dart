// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final riftRoute = GoRoute(
  path: 'rift',
  name: 'rift',
  builder: (context, state) {
    return const RiftPage();
  },
);
