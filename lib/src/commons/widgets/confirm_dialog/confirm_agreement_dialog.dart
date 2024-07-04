// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/widgets/base_dialog/base_dialog.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_button_group.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

/// 协议是否同意框
Future<bool?> commonConfirmAgreementDialog(BuildContext context) {
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
          "是否同意",
          style: context.textTheme.titleLarge?.bold(),
        ),
      );
    }),
    body: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: CommonLinkText(text: Strings.agreement),
    ),
    footer: const ConfirmButtonGroup(),
  );
}
