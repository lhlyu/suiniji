// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/widgets/pin_input/pin_input.dart';
import '../base_dialog/base_dialog.dart';

/// 短信验证码弹框
Future<bool?> commonCaptchaDialog(BuildContext context, String mobile) {
  return commonBaseDialog<bool>(
    context,
    header: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 20,
        ),
        child: Text(
          "短信验证",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        children: [
          Text("本次操作需要短信验证，验证码将会发送至您的手机号码 $mobile"),
          const SizedBox(height: 16),
          const PinInput(),
        ],
      ),
    ),
    footer: Column(
      children: [
        const Divider(),
        TextButton(
          onPressed: () {
            // 发送短信
          },
          style: TextButton.styleFrom(
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            fixedSize: const Size(
              double.maxFinite,
              48,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: BorderRadiusSizes.defaultSize.bottomLeft,
              ),
            ),
          ),
          child: Text(
            "重新发送",
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
            ),
          ),
        ),
      ],
    ),
  );
}
