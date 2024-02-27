// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/controllers/login/controller.dart';
import 'package:suiniji/src/routes/app_router.dart';

/// 确认登录
class ConfirmButton extends ConsumerWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    final disabled = state.password.isEmpty;

    // 点击后
    onPressed() async {
      HapticFeedback.lightImpact();
      Toast.success(state.password);
      context.pushReplacementNamedAndClearHistory(Routes.creation.name!);
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
        child: const Text("登录"),
      ),
    );
  }
}
