// Project imports:
import 'package:suiniji/src/services/user_service/model.dart';

/// 用户相关的服务
abstract class IUserService {
  /// 检查手机号码是否存在
  Future<CheckUserMobile?> checkUserMobile(String mobile);

  /// 发送短信
  Future<bool> sendCaptcha(UserLoginAndRegisterModel param);

  /// 登录
  Future<UserMobile?> loginAndRegister(UserLoginAndRegisterModel param);

  /// 登出
  Future<bool> logout();
}
