// Project imports:
import 'package:suiniji/src/commons/utils/toast.dart';
import 'package:suiniji/src/services/http.dart';
import 'package:suiniji/src/services/user_service/interface.dart';
import 'package:suiniji/src/services/user_service/model.dart';

class UserService extends IUserService {
  @override
  Future<CheckUserMobile?> checkUserMobile(String mobile) async {
    final rs = await httpService.get("user/mobile");
    if (rs.failed()) {
      Toast.error(rs.msg);
      return null;
    }
    final value = CheckUserMobile.fromJson(rs.data);
    return value;
  }

  @override
  Future<UserMobile?> loginAndRegister(UserLoginAndRegisterModel param) {
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    throw UnimplementedError();
  }

  @override
  Future<bool> sendCaptcha(UserLoginAndRegisterModel param) {
    throw UnimplementedError();
  }
}
