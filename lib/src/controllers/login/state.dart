// Project imports:
import 'package:suiniji/src/commons/utils/verify.dart';

/// 登录状态码
class LoginState {
  /// 国际编码
  final int countryCode;

  /// 手机号码
  final String mobile;

  /// 手机是否存在
  final bool has;

  /// 验证码
  final String captcha;

  /// 密码
  final String password;

  /// 密码
  final String repassword;

  /// 是否同意协议
  final bool agreement;

  /// 加载
  final bool loading;

  const LoginState({
    this.countryCode = 86,
    this.mobile = "",
    this.has = false,
    this.captcha = "",
    this.password = "",
    this.repassword = "",
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
    bool? has,
    String? captcha,
    String? password,
    String? repassword,
    bool? agreement,
    bool? loading,
  }) {
    return LoginState(
      countryCode: countryCode ?? this.countryCode,
      mobile: mobile ?? this.mobile,
      has: has ?? this.has,
      captcha: captcha ?? this.captcha,
      password: password ?? this.password,
      repassword: repassword ?? this.repassword,
      agreement: agreement ?? this.agreement,
      loading: loading ?? this.loading,
    );
  }
}
