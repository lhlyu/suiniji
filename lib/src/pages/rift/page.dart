// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/theme/border_radius_sizes.dart';

class RiftPage extends StatelessWidget {
  const RiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bodySmall = Theme.of(context).textTheme.bodySmall;
    final fontStyle = bodySmall?.copyWith(
      color: bodySmall.color?.withOpacity(0.4),
      fontSize: 11,
    );
    final linkFontStyle = bodySmall?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 11,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.appName,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before_outlined),
          onPressed: () {
            /// 返回
            context.pop();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).dividerTheme.color!,
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
                  _buildListTile(Icons.update_outlined, "当前版本", "v1.0.0"),
                  _buildListTile(Icons.arrow_circle_up_outlined, "版本更新", "有新版本"),
                  _buildListTile(Icons.web_outlined, "官网", Icons.navigate_next_outlined),
                  _buildListTile(Icons.help_center_outlined, "反馈", Icons.navigate_next_outlined),
                  _buildListTile(Icons.help_outline, "帮助", Icons.navigate_next_outlined),
                ],
              ).toList(),
            ),
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("服务协议", style: linkFontStyle),
                const SizedBox(width: 8),
                Text("隐私协议", style: linkFontStyle),
              ],
            ),
            const SizedBox(height: 4),
            Text("客户服务热线 123 1231 2311", style: fontStyle),
            const SizedBox(height: 4),
            Text("Copyright © 2000 - 2024 XYZ. All Rights Reserved. ", style: fontStyle),
            const SizedBox(height: 4),
            Text("ICP备案号：粤B1-20000000", style: fontStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData leadingIcon, String title, dynamic trailing) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 20,
      ),
      title: Text(title),
      trailing: trailing is IconData ? Icon(trailing) : Text(trailing),
    );
  }
}
