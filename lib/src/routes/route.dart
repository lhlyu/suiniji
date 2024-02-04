// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class Route {
  String name;

  Widget Function(
    BuildContext context,
    GoRouterState state,
  ) builder;

  Route(this.name, this.builder);

  @override
  String toString() => name;

  String get path => '/$name';

  GoRoute get getGoRoute => GoRoute(name: name, path: path, builder: builder);
}
