// Project imports:
import 'package:suiniji/src/commons/utils/verify.dart';

/// 登录状态码
class LoginState {
  /// 国际编码
  final int countryCode;

  /// 手机号码
  final String mobile;

  /// 验证码
  final String captcha;

  /// 密码
  final String password;

  /// 是否同意协议
  final bool agreement;

  /// 加载
  final bool loading;

  const LoginState({
    this.countryCode = 86,
    this.mobile = "",
    this.captcha = "",
    this.password = "",
    this.agreement = false,
    this.loading = false,
  });

  String get realMobile {
    return mobile.replaceAll(" ", "");
  }

  bool vaildPhone({bool regexp = false}) {
    if (regexp) {
      return isValidPhoneNumber(realMobile);
    }
    return realMobile.length == 11;
  }

  LoginState copyWith({
    int? countryCode,
    String? mobile,
    String? captcha,
    String? password,
    bool? agreement,
    bool? loading,
  }) {
    return LoginState(
      countryCode: countryCode ?? this.countryCode,
      mobile: mobile ?? this.mobile,
      captcha: captcha ?? this.captcha,
      password: password ?? this.password,
      agreement: agreement ?? this.agreement,
      loading: loading ?? this.loading,
    );
  }
}
