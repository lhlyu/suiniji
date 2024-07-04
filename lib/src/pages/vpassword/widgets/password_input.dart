// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/input/input.dart';
import 'package:suiniji/src/controllers/index.dart';

/// 密码输入
class PasswordInput extends ConsumerStatefulWidget {
  const PasswordInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends ConsumerState<PasswordInput> {
  final controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  bool visibility = false;

  @override
  void initState() {
    super.initState();

    /// 当小部件挂载到页面的时候输入框进行延迟聚焦
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        focusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  /// 获取清除按钮
  Widget getClearIcon() {
    final enable = ref.watch(loginControllerProvider).password.isNotEmpty;
    final opacity = enable ? 1.0 : 0.0;

    return Opacity(
      opacity: opacity,
      child: IconButton(
        icon: const Icon(
          Icons.clear_outlined,
          size: 16,
        ),
        onPressed: enable
            ? () {
                controller.clear();
                ref.read(loginControllerProvider.notifier).update(password: "");
                HapticFeedback.vibrate();
              }
            : null,
      ),
    );
  }

  /// 查看密码
  Widget getVisibilityIcon() {
    final enable = ref.watch(loginControllerProvider).password.isNotEmpty;
    final opacity = enable ? 1.0 : 0.0;
    return Opacity(
      opacity: opacity,
      child: IconButton(
        icon: visibility
            ? const Icon(Icons.visibility_outlined, size: 16)
            : const Icon(Icons.visibility_off_outlined, size: 16),
        onPressed: enable
            ? () {
                HapticFeedback.lightImpact();

                setState(() {
                  visibility = !visibility;
                });
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 48,
      child: CommonInput(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !visibility,
        maxLength: 16,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[\S]+')),
        ],
        onChanged: (value) {
          ref.read(loginControllerProvider.notifier).update(password: value);
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        suffixIcon: getClearIcon(),
        prefixIcon: getVisibilityIcon(),
        hintText: "请输入密码",
      ),
    );
  }
}
