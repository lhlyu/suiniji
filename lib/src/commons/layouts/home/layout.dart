// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/routes/app_router.dart';
import 'bottom_bar.dart';
import 'controller.dart';

class HomeLayout extends ConsumerWidget {
  final Widget? child;
  const HomeLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(homeLayoutControllerProvider.notifier).update(Routes.creation.name!);
          context.pushReplacementNamed(Routes.creation.name!);
        },
        hoverElevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        elevation: 0,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
