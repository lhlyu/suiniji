// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/widgets/confirm_dialog/confirm_agreement_dialog.dart';

/// 是否同意框
Future<bool?> showAgreementDialog(BuildContext context) {
  return commonConfirmAgreementDialog(context);
}
