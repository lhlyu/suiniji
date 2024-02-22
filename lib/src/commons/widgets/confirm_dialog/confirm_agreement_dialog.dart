// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/widgets/base_dialog/base_dialog.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_button_group.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

/// 协议是否同意框
Future<bool?> commonConfirmAgreementDialog(BuildContext context) {
  return commonBaseDialog<bool>(
    context,
    header: Builder(builder: (context) {
      return Text(
        "是否同意",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      );
    }),
    body: const CommonLinkText(text: Strings.agreement),
    footer: const ConfirmButtonGroup(),
  );
}
