// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/layouts/base/layout.dart';
import 'package:suiniji/src/commons/utils/helper.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_forget_password_dialog.dart';
import 'package:suiniji/src/controllers/index.dart';
import 'package:suiniji/src/pages/vpassword/widgets/confirm_button.dart';
import 'package:suiniji/src/pages/vpassword/widgets/password_input.dart';
import 'package:suiniji/src/routes/app_router.dart';

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
        context.textTheme.bodyMedium!.bold()!,
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
                style: context.textTheme.titleLarge?.bold(),
              ),
              const SizedBox(height: 14),
              Text(
                "当前手机号 ${state.mobile}",
                style: context.textTheme.bodyMedium?.bold()?.withOpacity(0.8),
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
                  commonConfirmForgetPasswordDialog(context).then(
                    (value) => {
                      if (!isNullOrFalse(value)) {context.pushNamed(Routes.about.name!)}
                    },
                  );
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
