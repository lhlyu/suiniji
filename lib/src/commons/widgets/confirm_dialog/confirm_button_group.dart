// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';

/// 确认组合按钮
class ConfirmButtonGroup extends StatelessWidget {
  final String ok;
  final String cancel;

  const ConfirmButtonGroup({
    super.key,
    this.ok = "确定",
    this.cancel = "取消",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: TextButton.styleFrom(
              elevation: 0,
              fixedSize: const Size(
                double.infinity,
                48,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: BorderRadiusSizes.defaultSize.bottomLeft,
                ),
              ),
            ),
            child: Text(
              cancel,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 1,
          height: 48,
          child: VerticalDivider(),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            style: TextButton.styleFrom(
              elevation: 0,
              surfaceTintColor: Colors.transparent,
              fixedSize: const Size(
                double.infinity,
                48,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: BorderRadiusSizes.defaultSize.bottomLeft,
                ),
              ),
            ),
            child: Text(
              ok,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
