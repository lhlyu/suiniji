// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/router.dart';
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/layouts/base/layout.dart';
import 'package:suiniji/src/commons/utils/helper.dart';
import 'package:suiniji/src/commons/widgets/button/button.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_code_not_received_dialog.dart';
import 'package:suiniji/src/commons/widgets/picture_click_captcha/picture_click_captcha.dart';
import 'package:suiniji/src/commons/widgets/pin_input/pin_input.dart';
import 'package:suiniji/src/controllers/index.dart';
import 'package:suiniji/src/routes/app_router.dart';

class VCaptchaPage extends ConsumerWidget {
  const VCaptchaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final action = ref.read(loginControllerProvider.notifier);
    final timerState = ref.watch(timerControllerProvider);
    final timerAction = ref.read(timerControllerProvider.notifier);

    return BaseLayout(
      title: "短信验证码登录",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 48,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "输入短信验证码",
                style: context.textTheme.titleLarge?.bold(),
              ),
              const SizedBox(height: 14),
              Text(
                "短信验证码至 ${state.mobile}",
                style: context.textTheme.bodyMedium?.bold()?.withOpacity(0.7),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 280,
                child: PinInput(
                  disabled: state.loading,
                  onComplete: (value) {
                    action.update(captcha: value);

                    if (state.has) {
                      context.pushReplacementNamedAndClearHistory(Routes.creation.name!);
                      action.update(captcha: "");
                      return;
                    }
                    context.pushReplacementNamedAndClearHistory(Routes.upassword.name!);
                    action.update(captcha: "");
                  },
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timerState > 0
                      ? Text("$timerState秒后重新发送", style: context.textTheme.bodyMedium?.bold()?.withOpacity(0.7))
                      : CommonButton(
                          text: true,
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            commonPictureClickCaptcha(context).then((value) {
                              if (isNullOrFalse(value)) {
                                return;
                              }
                              timerAction.start();
                              action.update(captcha: "");
                            });
                          },
                          data: "重新发送",
                        ),
                  const SizedBox(width: 16),
                  CommonButton(
                    text: true,
                    onPressed: () {
                      if (state.loading) {
                        return;
                      }
                      HapticFeedback.lightImpact();
                      commonConfirmCodeNotReceivedDialog(context).then(
                        (value) => {
                          if (!isNullOrFalse(value)) {context.pushNamed(Routes.about.name!)}
                        },
                      );
                    },
                    data: "没收到验证码？",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
