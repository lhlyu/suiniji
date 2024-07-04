// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/layouts/home/controller.dart';

class BottomItemBar extends ConsumerWidget {
  final String name;
  final Widget inactiveIcon;
  final Widget activeIcon;

  const BottomItemBar({
    super.key,
    required this.name,
    required this.inactiveIcon,
    required this.activeIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeLayoutControllerProvider);
    final action = ref.read(homeLayoutControllerProvider.notifier);
    return Expanded(
      child: IconButton(
        icon: state.current == name ? activeIcon : inactiveIcon,
        onPressed: () {
          if (action.update(name)) {
            context.goNamed(name);
          }
        },
      ),
    );
  }
}
