// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/router.dart';
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/commons/widgets/button/button.dart';
import 'package:suiniji/src/controllers/login/controller.dart';
import 'package:suiniji/src/routes/app_router.dart';

/// 确认登录
class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    final disabled = state.password.isEmpty || state.repassword.isEmpty;

    // 点击后
    onPressed() async {
      HapticFeedback.lightImpact();
      if (state.password != state.repassword) {
        Toast.error("两次密码不一致!");
        return;
      }
      Toast.success(state.password);
      context.pushReplacementNamedAndClearHistory(Routes.creation.name!);
    }

    return SizedBox(
      width: 280,
      height: 48,
      child: CommonButton(
        disabled: disabled,
        onPressed: onPressed,
        data: "确定",
      ),
    );
  }
}
