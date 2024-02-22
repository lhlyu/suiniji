// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiniji/src/commons/utils/helper.dart';

// Project imports:
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';
import 'package:suiniji/src/controllers/index.dart';
import 'package:suiniji/src/routes/app_router.dart';

class PasswordButton extends ConsumerWidget {
  const PasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final action = ref.read(loginControllerProvider.notifier);

    final disabled = !state.vaildPhone();

    // 点击后
    onPressed() async {
      if (!state.agreement) {
        final ok = await commonConfirmAgreementDialog(context);
        if (isNullOrFalse(ok)) {
          return;
        }
        action.updateAgreement(true);
        // 判断手机号码是否合法
        if (!state.vaildPhone(regexp: true)) {
          Toast.error("请输入正确的手机号码");
          return;
        }

        // 判断当前的widget是否还在
        if (!context.mounted) {
          return;
        }

        // API 判断手机号码是否注册，如果没有注册就跳转到注册页
        if (state.realMobile.startsWith("11")) {
          context.replaceNamed(Routes.register.name!);
          return;
        }

        // 已注册跳转到密码验证码页
        context.replaceNamed(Routes.vpassword.name!);

        return;
      }
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
