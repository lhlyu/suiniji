// 创建一个全局Logger实例

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:logger/logger.dart';

var logger = Logger(
  // 设置不同的日志级别
  filter: _LogFilter(),
  printer: PrettyPrinter(),
);

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // 基于当前环境配置日志级别
    if (kReleaseMode) {
      return event.level.value >= Level.warning.value;
    } else {
      return true;
    }
  }
}
