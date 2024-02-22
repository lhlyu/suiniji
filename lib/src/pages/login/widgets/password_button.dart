// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';
import 'package:suiniji/src/controllers/index.dart';

class PasswordButton extends ConsumerWidget {
  const PasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disabled = !ref.watch(loginControllerProvider).ok;

    // 点击后
    onPressed() async {
      if (!ref.watch(loginControllerProvider).agreement) {
        final ok = await commonConfirmAgreementDialog(context);
        if (ok!) {
          ref.read(loginControllerProvider.notifier).updateAgreement(true);
          Toast.success(ref.watch(loginControllerProvider).realMobile);
          return;
        }
        Toast.error("你没有同意协议");
        return;
      }
      Toast.success(ref.watch(loginControllerProvider).realMobile);
    }

    return TextButton(
      style: ButtonStyle(
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
        textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      onPressed: disabled ? null : onPressed,
      child: const Text(
        "密码登录",
      ),
    );
  }
}
