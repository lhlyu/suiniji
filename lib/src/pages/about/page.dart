// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/extension/theme.dart';
import 'package:suiniji/src/commons/layouts/base/layout.dart';
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';
import 'package:suiniji/src/commons/widgets/link_text/link_text.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodySmall = context.textTheme.bodySmall;
    final fontStyle = bodySmall?.copyWith(
      color: bodySmall.color?.withOpacity(0.4),
      fontSize: 11,
    );
    final linkFontStyle = bodySmall?.copyWith(
      color: context.colorScheme.primary,
      fontSize: 11,
    );

    final listFontStyle = context.textTheme.bodyMedium;

    return BaseLayout(
      title: "关于我们",
      hasFooter: true,
      footer: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonLinkText(text: Strings.userAgreement, linkStyle: linkFontStyle),
                const SizedBox(width: 8),
                CommonLinkText(text: Strings.privacyAgreement, linkStyle: linkFontStyle),
              ],
            ),
            const SizedBox(height: 4),
            Text("客户服务热线 123 1231 2311", style: fontStyle),
            const SizedBox(height: 4),
            Text("Copyright © 2000 - 2024 XYZ. All Rights Reserved. ", style: fontStyle),
            const SizedBox(height: 4),
            CommonLinkText(
              text: Strings.beian,
              textStyle: fontStyle,
              linkStyle: fontStyle?.copyWith(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.dividerTheme.color!,
                width: 1,
              ),
              borderRadius: BorderRadiusSizes.defaultSize,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              children: ListTile.divideTiles(
                context: context,
                tiles: [
                  _buildListTile("当前版本", "v1.0.0", leadingAndTrailingTextStyle: listFontStyle),
                  _buildListTile("版本更新", "有新版本", leadingAndTrailingTextStyle: listFontStyle),
                  _buildListTile("官网", Icons.navigate_next_outlined),
                  _buildListTile("反馈", Icons.navigate_next_outlined),
                  _buildListTile("帮助", Icons.navigate_next_outlined),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, dynamic trailing, {TextStyle? leadingAndTrailingTextStyle}) {
    return ListTile(
      title: Text(title),
      trailing: trailing is IconData ? Icon(trailing, weight: 100) : Text(trailing),
      leadingAndTrailingTextStyle: leadingAndTrailingTextStyle,
    );
  }
}
