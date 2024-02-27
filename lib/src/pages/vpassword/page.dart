// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:suiniji/src/commons/layouts/base_layout.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_forget_password_dialog.dart';
import 'package:suiniji/src/controllers/index.dart';
import 'package:suiniji/src/pages/vpassword/widgets/confirm_button.dart';
import 'package:suiniji/src/pages/vpassword/widgets/password_input.dart';

/// 密码登录
class VPasswordPage extends ConsumerWidget {
  const VPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

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
      title: "密码登录",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 48,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "输入登录密码",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                "当前手机号 ${state.mobile}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 48),
              const PasswordInput(),
              const SizedBox(height: 16),
              const ConfirmButton(),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  if (state.loading) {
                    return;
                  }
                  HapticFeedback.lightImpact();
                  commonConfirmForgetPasswordDialog(context);
                },
                style: buttonStyle,
                child: const Text(
                  "忘记密码？",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
