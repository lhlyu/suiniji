// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';

/// 确认组合按钮
class ConfirmButtonGroup extends StatelessWidget {
  final String ok;
  final String cancel;
  // 布局排序[0, 1, 2] => [取消按钮, 分割线, 确定按钮]
  final List<int> order;

  const ConfirmButtonGroup({
    super.key,
    this.ok = "确定",
    this.cancel = "取消",
    this.order = const [0, 1, 2],
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
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
    );

    final cancelButton = Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        style: buttonStyle,
        child: Text(
          cancel,
          style: TextStyle(
            fontSize: context.textTheme.bodyMedium?.fontSize,
            color: context.colorScheme.onBackground,
          ),
        ),
      ),
    );

    const gap = SizedBox(
      width: 1,
      height: 48,
      child: VerticalDivider(),
    );

    final okButton = Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop(true);
        },
        style: buttonStyle,
        child: Text(
          ok,
          style: TextStyle(
            fontSize: context.textTheme.bodyMedium?.fontSize,
          ),
        ),
      ),
    );

    List<Widget> orders = [
      cancelButton,
      gap,
      okButton,
    ];

    List<Widget> row = [];

    for (var value in order) {
      row.add(orders[value]);
    }

    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row,
        ),
      ],
    );
  }
}
