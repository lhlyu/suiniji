import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:suiniji/src/commons/constants/strings.dart';

/// appbar
class AppHeader extends StatelessWidget {
  final String? title;
  final bool canBack;

  const AppHeader({super.key, this.title, this.canBack = true});

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? Strings.appName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.navigate_before_outlined),
        onPressed: () {
          if (!canBack) {
            return;
          }

          /// 返回
          context.pop();
        },
      ),
    );
  }
}
