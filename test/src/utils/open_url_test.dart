// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('open url ...', (tester) async {
    final uri = Uri.parse("suiniji://webview?link=https://www.baidu.com&title=百度");

    /// suiniji
    print("---> ${uri.scheme}");

    /// webview
    print("---> ${uri.host}");

    /// link=https://www.baidu.com&title=%E7%99%BE%E5%BA%A6
    print("---> ${uri.query}");

    /// {link: https://www.baidu.com, title: 百度}
    print("---> ${uri.queryParameters}");
  });
}
