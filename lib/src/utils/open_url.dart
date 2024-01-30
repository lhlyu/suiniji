import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:suiniji/src/log/log.dart';
import 'package:suiniji/src/routes/app_router.dart';
import 'package:url_launcher/url_launcher.dart';

/// 打开任意的链接
/// doc: https://pub.dev/packages/url_launcher
void openUrl(BuildContext context, String url) async {
  final uri = Uri.parse(url);

  /// 如果是特殊的需要打开内部webview
  if (uri.scheme == "suiniji" && uri.host == "webview") {
    context.pushNamed(routes.webview.name, queryParameters: uri.queryParameters);
    return;
  }
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
    return;
  }
}
