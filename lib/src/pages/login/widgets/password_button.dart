// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 密码登录
class PasswordButton extends ConsumerWidget {
  const PasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          const Size.fromHeight(20),
        ),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        "账号密码登录",
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
