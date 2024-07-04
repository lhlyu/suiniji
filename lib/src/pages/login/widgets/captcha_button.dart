// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/utils/helper.dart';
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/widgets/button/button.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';
import 'package:suiniji/src/commons/widgets/picture_click_captcha/picture_click_captcha.dart';
import 'package:suiniji/src/controllers/login/controller.dart';
import 'package:suiniji/src/controllers/timer/controller.dart';
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
        action.update(agreement: true);
      }

      // 判断手机号码是否合法
      if (!state.vaildPhone(regexp: true)) {
        Toast.error("请输入正确的手机号码");
        return;
      }

      // API 判断手机号码是否注册，如果没有注册就跳转到注册页
      if (state.realMobile.startsWith("11")) {
        action.update(has: false);
      } else {
        action.update(has: true);
      }

      if (ref.watch(timerControllerProvider) == 0) {
        await Future.delayed(const Duration(milliseconds: 300));

        if (!context.mounted) {
          return;
        }
        final ok = await commonPictureClickCaptcha(context);
        if (isNullOrFalse(ok)) {
          return;
        }
        // 开始倒计时
        ref.read(timerControllerProvider.notifier).start();
      }
      if (!context.mounted) {
        return;
      }
      context.pushNamed(Routes.vchaptcha.name!);
    }

    return SizedBox(
      width: 280,
      height: 48,
      child: CommonButton(
        disabled: disabled,
        onPressed: onPressed,
        data: "验证码登录",
      ),
    );
  }
}
