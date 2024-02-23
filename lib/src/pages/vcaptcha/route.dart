// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import './page.dart';

final vcaptchaRoute = GoRoute(
  path: 'vcaptcha',
  name: 'vcaptcha',
  builder: (context, state) {
    return const VCaptchaPage();
  },
);
