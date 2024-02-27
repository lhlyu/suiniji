// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/base_dialog/base_dialog.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_button_group.dart';

const _tip = """1、若您忘记了密码，可以使用验证码登录
2、若您需要修改密码，请在登录后访问设置页面，按照指示进行密码更新，保障账户安全""";

/// 忘记密码
Future<bool?> commonConfirmForgetPasswordDialog(BuildContext context) {
  return commonBaseDialog<bool>(
    context,
    header: Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24,
          bottom: 0,
        ),
        child: Text(
          "忘记密码",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }),
    body: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Text(_tip),
    ),
    footer: const ConfirmButtonGroup(
      cancel: "知道了",
      order: [0],
    ),
  );
}
