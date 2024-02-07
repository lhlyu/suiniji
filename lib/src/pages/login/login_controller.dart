// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

/// 登录状态
class LoginState {
  /// 手机号码
  final String mobile;

  /// 验证码
  final String captcha;

  /// 是否同意协议
  final bool agreement;

  const LoginState({
    this.mobile = "",
    this.captcha = "",
    this.agreement = false,
  });

  LoginState copyWith({
    String? mobile,
    String? captcha,
    bool? agreement,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      captcha: captcha ?? this.captcha,
      agreement: agreement ?? this.agreement,
    );
  }
}

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

  void changeAgreement(bool agreement) {
    state = state.copyWith(agreement: agreement);
  }

  String getRealPhone() {
    return state.mobile.replaceAll(' ', '');
  }
}
