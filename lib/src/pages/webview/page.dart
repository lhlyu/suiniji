// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';

class WebviewPage extends StatelessWidget {
  final String title;
  final String link;

  const WebviewPage({
    super.key,
    this.title = '',
    this.link = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.isEmpty ? Strings.appName : title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
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
          applicationNameForUserAgent: Strings.appName.toUpperCase(),
          disallowOverScroll: true,
        ),
      ),
    );
  }
}
