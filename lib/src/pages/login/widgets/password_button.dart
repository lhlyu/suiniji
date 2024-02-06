// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 密码登录
class PasswordButton extends ConsumerWidget {
  final bool disabled;
  final VoidCallback? onClick;

  const PasswordButton({super.key, this.disabled = true, this.onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onClick,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: const Text(
        "账号密码登录",
      ),
    );
  }
}
