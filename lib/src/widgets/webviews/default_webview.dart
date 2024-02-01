import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:suiniji/src/commons/constant.dart';

class DefaultWebview extends StatelessWidget {
  final String title;

  final String link;

  const DefaultWebview({
    super.key,
    this.title = Constant.appName,
    this.link = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            /// 返回
            context.pop();
          },
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(link)),
        ),
        initialSettings: InAppWebViewSettings(
          applicationNameForUserAgent: Constant.appName.toUpperCase(),
          disallowOverScroll: true,
        ),
      ),
    );
  }
}
