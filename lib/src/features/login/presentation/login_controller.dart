// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

class LoginState {
  /// 是否同意协议
  final bool isAgreement;

  /// 手机国际编码
  final String countryCode;

  /// 手机号码
  final String mobile;

  /// 登录的方式
  /// 1: 短信验证码; 2: 密码登录
  final int loginType;

  const LoginState({
    this.isAgreement = false,
    this.countryCode = '86',
    this.mobile = '',
    this.loginType = 1,
  });
}

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<LoginState> build() {
    return const LoginState();
  }

  void updateMobile(String mobile) {}
}
