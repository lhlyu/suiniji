import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_template/utils/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  static final AppInfo _instance = AppInfo._internal();

  factory AppInfo() {
    return _instance;
  }

  AppInfo._internal();

  String? _appName;
  String? _packageName;
  String? _appVersion;
  String? _buildNumber;

  Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appName = packageInfo.appName;
    _packageName = packageInfo.packageName;
    _appVersion = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;

    final deviceInfo = await DeviceInfoPlugin().deviceInfo;
    final allInfo = deviceInfo.data;

    logger.i('应用信息: $packageInfo');
    logger.i('设备信息: $allInfo');
  }

  String? getAppName() {
    return _appName;
  }
}
