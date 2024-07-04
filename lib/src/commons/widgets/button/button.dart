// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';

class CommonButton extends StatelessWidget {
  /// 按钮类型: default | primary | error
  final String type;
  final bool disabled;
  final VoidCallback? onPressed;
  final String data;

  /// 是否是文本按钮
  final bool text;

  const CommonButton({
    super.key,
    this.type = "primary",
    this.disabled = false,
    required this.onPressed,
    required this.data,
    this.text = false,
  }) : assert(type == "default" || type == "primary" || type == "error");

  @override
  Widget build(BuildContext context) {
    if (text) {
      return TextButton(
        style: ButtonStyle(
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) return Colors.transparent;
              if (states.contains(MaterialState.pressed)) return Colors.transparent;

              if (type == "default") {
                return Colors.transparent;
              }

              return null;
            },
          ),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          textStyle: MaterialStatePropertyAll(
            context.textTheme.bodyMedium?.bold(),
          ),
        ),
        onPressed: disabled ? null : onPressed,
        child: Text(data),
      );
    }

    return FilledButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        minimumSize: const MaterialStatePropertyAll(
          Size(double.infinity, double.infinity),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusSizes.defaultSize,
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          context.textTheme.bodyMedium?.bold(),
        ),
      ),
      onPressed: disabled ? null : onPressed,
      child: Text(data),
    );
  }
}
