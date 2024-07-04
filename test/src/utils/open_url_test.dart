// ignore_for_file: avoid_print

// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

void main() {
  testWidgets('open url ...', (tester) async {
    // final uri = Uri.parse("suiniji://webview?link=https://www.baidu.com&title=百度");

    // /// suiniji
    // print("---> ${uri.scheme}");

    // /// webview
    // print("---> ${uri.host}");

    // /// link=https://www.baidu.com&title=%E7%99%BE%E5%BA%A6
    // print("---> ${uri.query}");

    // /// {link: https://www.baidu.com, title: 百度}
    // print("---> ${uri.queryParameters}");

    // const c = Color(0xFF000000);

    // print(c.withOpacity(0.2));

    // 生成UUID版本4（随机生成）
    final uuidV4 = const Uuid().v4();
    print('UUID v4: $uuidV4');

    // 生成UUID版本1（基于时间）
    final uuidV1 = const Uuid().v1();
    print('UUID v1: $uuidV1');
  });
}
