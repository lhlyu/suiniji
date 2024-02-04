// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/constants.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

/// 协议同意框
class AgreementCheckbox extends ConsumerWidget {
  final double? w;

  const AgreementCheckbox(this.w, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: false,
            onChanged: (value) {},
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CommonLinkText(
              text: Constants.agreement,
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.7,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
