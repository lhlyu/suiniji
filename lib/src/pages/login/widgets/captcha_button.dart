// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';
import 'package:suiniji/src/controllers/login/controller.dart';

class CaptchaButton extends ConsumerWidget {
  const CaptchaButton({super.key});

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

    return SizedBox(
      width: 280,
      height: 48,
      child: FilledButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          minimumSize: const MaterialStatePropertyAll(Size(double.infinity, double.infinity)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusSizes.defaultSize,
            ),
          ),
        ),
        onPressed: disabled ? null : onPressed,
        child: const Text("验证码登录"),
      ),
    );
  }
}
