// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/layouts/base/layout.dart';
import 'package:suiniji/src/controllers/index.dart';
import './widgets/confirm_button.dart';
import './widgets/password_input.dart';
import './widgets/repassword_input.dart';

/// 修改密码或者添加密码
class UPasswordPage extends ConsumerWidget {
  const UPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    return BaseLayout(
      title: "设置密码",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 48,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "设置登录密码",
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
              const RePasswordInput(),
              const SizedBox(height: 16),
              const ConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
