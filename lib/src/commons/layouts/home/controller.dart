// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller.g.dart';

@riverpod
class HomeLayoutController extends _$HomeLayoutController {
  @override
  HomeLayoutState build() {
    return const HomeLayoutState();
  }

  bool update(String current) {
    if (current == state.current) {
      return false;
    }
    state = HomeLayoutState(current: current);
    return true;
  }
}

class HomeLayoutState {
  final String current;

  const HomeLayoutState({this.current = ""});
}
