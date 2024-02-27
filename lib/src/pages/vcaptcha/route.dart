// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/routes/animation.dart';
import './page.dart';

final vcaptchaRoute = GoRoute(
  path: 'vcaptcha',
  name: 'vcaptcha',
  pageBuilder: (context, state) => RouterTransitionFactory.slide(
    context,
    state,
    const VCaptchaPage(),
  ),
);
