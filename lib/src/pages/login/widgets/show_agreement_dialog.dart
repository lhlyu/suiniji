// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/constants.dart';
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_dialog.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

/// 是否同意框
Future<bool?> showAgreementDialog(BuildContext context) {
  return commonShowAgreementDialog(
    context,
    title: "同意协议",
    content: const CommonLinkText(
      text: Constants.agreement,
    ),
  );
}
