// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 验证码登录
class CaptchaButton extends ConsumerWidget {
  final double w;
  final double h;
  final double r;

  const CaptchaButton(this.w, this.h, this.r, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () {
        HapticFeedback.lightImpact();
      },
      style: TextButton.styleFrom(
        elevation: 0,
        fixedSize: Size(w, h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r),
        ),
        enableFeedback: true,
      ),
      child: Text(
        "验证码登录",
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: Colors.white,
        ),
      ),
    );
  }
}
