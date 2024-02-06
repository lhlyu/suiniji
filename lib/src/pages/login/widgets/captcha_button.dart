// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 验证码登录
class CaptchaButton extends ConsumerWidget {
  final double width;
  final double height;
  final double radius;
  final bool disabled;
  final VoidCallback? onClick;

  const CaptchaButton({
    super.key,
    this.width = 280,
    this.height = 48,
    this.radius = 8,
    this.disabled = true,
    this.onClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: onClick,
      style: FilledButton.styleFrom(
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        enableFeedback: true,
      ),
      child: const Text(
        "验证码登录",
      ),
    );
  }
}
