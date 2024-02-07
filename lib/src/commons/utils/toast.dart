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
      backgroundColor: const Color(0xFF2080F0),
      radius: 4,
    );
  }

  static void success(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xFF18A058),
      radius: 4,
    );
  }

  static void warning(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xFFF0A020),
      radius: 4,
    );
  }

  static void error(String message) {
    showToast(
      message,
      duration: const Duration(seconds: 3),
      position: ToastPosition.top,
      backgroundColor: const Color(0xFFD03050),
      radius: 4,
    );
  }
}
