// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/widgets/base_dialog/dialog.dart';

Future<T?> commonBaseDialog<T>(
  BuildContext context, {
  Widget? header,
  Widget? body,
  Widget? footer,
}) {
  final children = <Widget>[];
  if (header != null) {
    children.add(header);
  }
  if (body != null) {
    children.add(
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: body,
      ),
    );
  }
  if (footer != null) {
    children.add(const Divider());
    children.add(footer);
  }
  return showElasticDialog<T>(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusSizes.defaultSize,
        ),
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusSizes.defaultSize,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      );
    },
  );
}
