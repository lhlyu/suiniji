// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:suiniji/src/commons/utils/open_url.dart';

/// 匹配链接的规则
final _pattern = RegExp(r'\[([^\]]+)\]\(([a-z-A-Z]+[^\)]+)\)', caseSensitive: false);

/// 带有链接的文本
class CommonLinkText extends StatelessWidget {
  /// 文本内容
  final String text;

  /// 普通文本样式
  final TextStyle? textStyle;

  /// 链接的文本样式
  final TextStyle? linkStyle;

  const CommonLinkText({
    super.key,
    required this.text,
    this.textStyle,
    this.linkStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: _getSpans(
          context,
          text,
          linkStyle ??
              TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  List<InlineSpan> _getSpans(BuildContext context, String text, TextStyle? linkStyle) {
    List<InlineSpan> spans = [];
    text.splitMapJoin(
      _pattern,
      onMatch: (Match match) {
        // 添加链接文本
        spans.add(
          TextSpan(
            text: match.group(1),
            style: linkStyle,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                openUrl(context, match.group(2)!);
              },
          ),
        );
        return '';
      },
      onNonMatch: (String nonMatchText) {
        spans.add(TextSpan(text: nonMatchText));
        return '';
      },
    );
    return spans;
  }
}