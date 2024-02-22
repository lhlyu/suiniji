// Package imports:
import 'package:oktoast/oktoast.dart';

// Project imports:
import 'package:suiniji/src/commons/theme/app_theme.dart';

class Toast {
  static void info(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: AppTheme.primaryColor,
      radius: 4,
    );
  }

  static void success(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: AppTheme.successColor,
      radius: 4,
    );
  }

  static void warning(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: AppTheme.warningColor,
      radius: 4,
    );
  }

  static void error(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: AppTheme.errorColor,
      radius: 4,
    );
  }
}
