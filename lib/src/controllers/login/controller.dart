// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:suiniji/src/controllers/login/state.dart';

part 'controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return const LoginState();
  }

  void updateMobile(String mobile) {
    state = state.copyWith(mobile: mobile);
  }

  void updateCaptcha(String captcha) {
    state = state.copyWith(captcha: captcha);
  }

  void updateAgreement(bool agreement) {
    state = state.copyWith(agreement: agreement);
  }
}
