// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';
import 'package:suiniji/src/controllers/index.dart';

class AgreementCheckbox extends ConsumerWidget {
  const AgreementCheckbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 280,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            onChanged: (value) {
              ref.read(loginControllerProvider.notifier).update(agreement: value);
            },
            value: ref.watch(loginControllerProvider).agreement,
            side: MaterialStateBorderSide.resolveWith(
              (Set<MaterialState> states) {
                return BorderSide(
                  width: 1,
                  color: context.colorScheme.primary,
                );
              },
            ),
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CommonLinkText(
              text: Strings.agreement,
              textStyle: context.textTheme.bodyMedium?.bold(
                height: 1.6,
              ),
              linkStyle: context.textTheme.bodyMedium?.bold(
                color: context.colorScheme.primary,
                height: 1.6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
