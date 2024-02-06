// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

/// 登录状态
class LoginState {
  /// 手机号码
  final String mobile;

  /// 是否同意协议
  final bool agreement;

  const LoginState({
    this.mobile = "",
    this.agreement = false,
  });

  LoginState copyWith({
    String? mobile,
    bool? agreement,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
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

  void changeAgreement(bool agreement) {
    state = state.copyWith(agreement: agreement);
  }

  bool disabled() {
    return state.mobile.length < 13;
  }
}
