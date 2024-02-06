// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/pages/login/login_controller.dart';
import 'package:suiniji/src/pages/login/widgets/agreement_checkbox.dart';
import 'package:suiniji/src/pages/login/widgets/captcha_button.dart';
import 'package:suiniji/src/pages/login/widgets/footer.dart';
import 'package:suiniji/src/pages/login/widgets/password_button.dart';
import 'package:suiniji/src/pages/login/widgets/phone_input.dart';
import 'package:suiniji/src/pages/login/widgets/show_agreement_dialog.dart';
import 'package:suiniji/src/routes/app_router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final action = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);

    final disabled = action.disabled();

    final onClick = disabled
        ? null
        : () async {
            HapticFeedback.lightImpact();
            if (!state.agreement) {
              // 没有同意协议，需要弹出提示框
              final ok = await showAgreementDialog(context);
              if (ok == null || ok == false) {
                return;
              }
              action.changeAgreement(true);
            }
            // 同意，检查手机号码
            if (!context.mounted) return;
            context.goNamed(routes.home.name);
          };

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhoneInput(
              onChange: (val) {
                action.updateMobile(val);
              },
            ),
            const SizedBox(height: 16),
            CaptchaButton(
              disabled: disabled,
              onClick: onClick,
            ),
            const SizedBox(height: 12),
            PasswordButton(
              disabled: disabled,
              onClick: onClick,
            ),
            const SizedBox(height: 4),
            AgreementCheckbox(
              agreement: state.agreement,
              onChanged: (value) {
                action.changeAgreement(value!);
              },
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
      bottomSheet: const Footer(),
    );
  }
}
