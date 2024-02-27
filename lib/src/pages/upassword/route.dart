import 'package:go_router/go_router.dart';
import 'package:suiniji/src/pages/upassword/page.dart';
import 'package:suiniji/src/routes/animation.dart';

final upasswordRoute = GoRoute(
  path: 'upassword',
  name: 'upassword',
  pageBuilder: (context, state) {
    return RouterTransitionFactory.slide(
      context,
      state,
      const UPasswordPage(),
    );
  },
);
