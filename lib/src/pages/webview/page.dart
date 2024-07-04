// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/layouts/base/layout.dart';
import 'package:suiniji/src/commons/log/log.dart';

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
    return BaseLayout(
      title: title.isEmpty ? Strings.appName : title,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(Uri.parse(link)),
        ),
        initialSettings: InAppWebViewSettings(
          applicationNameForUserAgent: Strings.appName.toUpperCase(),
          disallowOverScroll: true,
          javaScriptEnabled: true,
          disableDefaultErrorPage: true,
          sharedCookiesEnabled: true,
        ),
        onReceivedHttpError: (controller, request, errorResponse) {
          logger.e("onReceivedHttpError: $errorResponse");
        },
        onReceivedError: (controller, request, errorResponse) {
          logger.e("onReceivedError: $errorResponse");
        },
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
        },
      ),
    );
  }
}
