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

  void update({
    int? countryCode,
    String? mobile,
    bool? has,
    String? captcha,
    String? password,
    String? repassword,
    bool? agreement,
    bool? loading,
  }) {
    state = state.copyWith(
      countryCode: countryCode,
      mobile: mobile,
      has: has,
      captcha: captcha,
      password: password,
      repassword: repassword,
      agreement: agreement,
      loading: loading,
    );
  }
}
