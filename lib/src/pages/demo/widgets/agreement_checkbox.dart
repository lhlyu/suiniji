// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

/// 协议同意框
class AgreementCheckbox extends ConsumerWidget {
  final double width;
  final bool agreement;
  final void Function(bool value)? onChanged;

  const AgreementCheckbox({super.key, this.width = 280, this.agreement = false, this.onChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            side: MaterialStateBorderSide.resolveWith(
              (Set<MaterialState> states) {
                return BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                );
              },
            ),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            value: agreement,
            onChanged: (value) {
              onChanged!(value!);
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CommonLinkText(
              text: Strings.agreement,
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.6,
                  ),
              linkStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    height: 1.6,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
