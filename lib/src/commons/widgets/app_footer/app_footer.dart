// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/routes/app_router.dart';

class AppFooter extends ConsumerWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        context.pushNamed(Routes.about.name!);
      },
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Text(
          Strings.appName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
