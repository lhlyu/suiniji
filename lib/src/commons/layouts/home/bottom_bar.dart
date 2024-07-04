// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/routes/app_router.dart';
import 'bottom_item_bar.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  Widget _buildMiddleTabItem() {
    return const Expanded(
      child: SizedBox(
        height: 60,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      BottomItemBar(
        name: Routes.note.name!,
        inactiveIcon: const Icon(Icons.home_outlined),
        activeIcon: Icon(
          Icons.home_outlined,
          color: context.colorScheme.primary,
        ),
      ),
      _buildMiddleTabItem(),
      BottomItemBar(
        name: Routes.profile.name!,
        inactiveIcon: const Icon(Icons.person_outline),
        activeIcon: Icon(
          Icons.person_outline,
          color: context.colorScheme.primary,
        ),
      ),
    ];

    return BottomAppBar(
      color: context.colorScheme.background,
      surfaceTintColor: context.colorScheme.background,
      shadowColor: context.colorScheme.background,
      shape: const CircularNotchedRectangle(),
      elevation: 16,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }
}
