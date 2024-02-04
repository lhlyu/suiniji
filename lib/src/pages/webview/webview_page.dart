// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/constants.dart';

class WebviewPage extends StatelessWidget {
  final String title;

  final String link;

  const WebviewPage({
    super.key,
    this.title = Constants.appName,
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
          applicationNameForUserAgent: Constants.appName.toUpperCase(),
          disallowOverScroll: true,
        ),
      ),
    );
  }
}
