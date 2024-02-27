// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/base_dialog/base_dialog.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_button_group.dart';

const _tip = """1、请确认手机号是否为当前使用的手机号
2、手机号欠费或被停用
3、检查短信是否被拦截
4、运营商网络原因，短信可能延迟到达
5、触发运营商或平台发送频率限制
6、手机设备故障""";

/// 收不到验证码
Future<bool?> commonConfirmCodeNotReceivedDialog(BuildContext context) {
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
          "收不到验证码",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }),
    body: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Text(_tip),
    ),
    footer: const ConfirmButtonGroup(
      ok: "我需要帮助",
      cancel: "我知道了",
      order: [2, 1, 0],
    ),
  );
}
