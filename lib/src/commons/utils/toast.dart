// Dart imports:
import 'dart:ui';

// Package imports:
import 'package:oktoast/oktoast.dart';

class Toast {
  static void info(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xff919399),
      radius: 4,
    );
  }

  static void success(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xff7ebf50),
      radius: 4,
    );
  }

  static void warning(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xffdda451),
      radius: 4,
    );
  }

  static void error(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 4),
      position: ToastPosition.top,
      backgroundColor: const Color(0xffe57471),
      radius: 4,
    );
  }
}
