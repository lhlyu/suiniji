// Dart imports:
import 'dart:async';

// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

const timeDownDuration = 10;

@riverpod
class TimerController extends _$TimerController {
  Timer? _timer;

  @override
  int build() {
    return 0;
  }

  void start() {
    if (_timer != null) return;
    state = timeDownDuration;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state > 0) {
          state--;
        } else {
          reset();
        }
        ref.notifyListeners();
      },
    );
  }

  void reset() {
    state = 0;
    _timer?.cancel();
    _timer = null;
  }
}
