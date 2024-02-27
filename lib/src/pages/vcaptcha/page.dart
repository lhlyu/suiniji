// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiniji/src/commons/layouts/base_layout.dart';

// Project imports:
import 'package:suiniji/src/commons/utils/helper.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_code_not_received_dialog.dart';
import 'package:suiniji/src/commons/widgets/picture_click_captcha/picture_click_captcha.dart';
import 'package:suiniji/src/commons/widgets/pin_input/pin_input.dart';
import 'package:suiniji/src/controllers/index.dart';
import 'package:suiniji/src/controllers/timer/controller.dart';
import 'package:suiniji/src/routes/app_router.dart';

class VCaptchaPage extends ConsumerWidget {
  const VCaptchaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);
    final action = ref.read(loginControllerProvider.notifier);
    final timerState = ref.watch(timerControllerProvider);
    final timerAction = ref.read(timerControllerProvider.notifier);

    final buttonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) return Colors.transparent;
          if (states.contains(MaterialState.pressed)) return Colors.transparent;
          return null;
        },
      ),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        Theme.of(context).textTheme.bodySmall!,
      ),
    );

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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "短信验证码至 ${state.mobile}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: 220,
                child: PinInput(
                  disabled: state.loading,
                  onComplete: (value) {
                    action.updateLoading(true);
                    action.updateCaptcha(value);

                    context.pushReplacementNamedAndClearHistory(Routes.creation.name!);

                    action.updateLoading(false);
                    action.updateCaptcha("");
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  timerState > 0
                      ? Text("$timerState秒后重新发送", style: Theme.of(context).textTheme.bodySmall)
                      : TextButton(
                          onPressed: () {
                            HapticFeedback.lightImpact();
                            commonPictureClickCaptcha(context).then((value) {
                              timerAction.start();
                              action.updateLoading(false);
                              action.updateCaptcha("");
                            });
                          },
                          style: buttonStyle,
                          child: const Text(
                            "重新发送",
                          ),
                        ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      if (state.loading) {
                        return;
                      }
                      HapticFeedback.lightImpact();
                      commonConfirmCodeNotReceivedDialog(context).then((value) => {
                            if (!isNullOrFalse(value)) {context.pushNamed(Routes.about.name!)}
                          });
                    },
                    style: buttonStyle,
                    child: const Text(
                      "没收到验证码？",
                    ),
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
