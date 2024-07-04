// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required String type,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case 'fade':
            return FadeTransition(opacity: animation, child: child);
          case 'rotation':
            return RotationTransition(turns: animation, child: child);
          case 'size':
            return SizeTransition(sizeFactor: animation, child: child);
          case 'scale':
            return ScaleTransition(scale: animation, child: child);
          case 'slide':
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
              child: child,
            );
          default:
            return FadeTransition(opacity: animation, child: child);
        }
      },
    );
  }

  static CustomTransitionPage scale(BuildContext context, GoRouterState state, Widget child) {
    return getTransitionPage(context: context, state: state, child: child, type: "scale");
  }

  static CustomTransitionPage slide(BuildContext context, GoRouterState state, Widget child) {
    return getTransitionPage(context: context, state: state, child: child, type: "slide");
  }
}
