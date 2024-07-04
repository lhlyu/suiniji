// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/widgets/app_footer/app_footer.dart';

class BaseLayout extends StatelessWidget {
  final String? title;
  final bool canBack;
  final bool hasFooter;

  final Widget child;
  final Widget? footer;

  const BaseLayout({
    super.key,
    this.title,
    this.canBack = true,
    this.hasFooter = false,
    required this.child,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(
                title!,
                style: context.textTheme.titleSmall?.bold(),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.navigate_before_outlined),
                onPressed: () {
                  if (canBack) {
                    context.pop();
                    return;
                  }
                },
              ),
            )
          : null,
      body: child,
      bottomSheet: hasFooter ? (footer ?? const AppFooter()) : null,
    );
  }
}
