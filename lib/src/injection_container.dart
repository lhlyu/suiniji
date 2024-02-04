// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:suiniji/src/commons/log/log.dart';
import 'package:suiniji/src/services/http.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  logger.i("依赖注册");

  /// 网络检测
  sl.registerLazySingleton(() => InternetConnectionChecker());

  /// 请求
  sl.registerLazySingleton<HttpService>(() => HttpService());

  /// 存储
  sl.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());
  sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  logger.i("注册完成");
}
