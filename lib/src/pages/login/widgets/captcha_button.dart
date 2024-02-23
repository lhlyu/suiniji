// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/utils/helper.dart';
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/utils/verify.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';
import 'package:suiniji/src/controllers/login/controller.dart';
import 'package:suiniji/src/routes/app_router.dart';

class CaptchaButton extends ConsumerWidget {
  const CaptchaButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final action = ref.read(loginControllerProvider.notifier);

    final disabled = !state.vaildPhone();

    // 点击后
    onPressed() async {
      HapticFeedback.lightImpact();
      if (!state.agreement) {
        final ok = await commonConfirmAgreementDialog(context);
        if (isNullOrFalse(ok)) {
          return;
        }
        action.updateAgreement(true);
      }

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
        context.pushNamed(Routes.register.name!);
        return;
      }

      // 已注册跳转到短信验证码页
      context.pushNamed(Routes.vchaptcha.name!);
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
          textStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        onPressed: disabled ? null : onPressed,
        child: const Text("验证码登录"),
      ),
    );
  }
}
