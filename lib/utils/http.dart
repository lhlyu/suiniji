import 'package:dio/dio.dart';
import 'package:flutter_template/utils/logger.dart';

class _HttpService {
  late Dio _dio;
  static final _HttpService _instance = _HttpService._internal();

  factory _HttpService() {
    return _instance;
  }

  _HttpService._internal() {
    _dio = Dio();

    /// Dio 配置
    _dio.options.baseUrl = "https://mock.tatakai.top";
    _dio.options.connectTimeout = const Duration(milliseconds: 12000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 12000);

    /// 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // options.headers["Authorization"] = "Bearer your_token";
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.d(response.data);
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        logger.e(e.message);
        return handler.next(e);
      },
    ));
  }

  /// GET 请求
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      var response = await _dio.get(path, queryParameters: query);
      return response;
    } catch (e) {
      logger.e(e);
      throw Exception('GET请求失败');
    }
  }

  /// POST 请求
  Future<Response> post(String path, {dynamic data}) async {
    try {
      var response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      logger.e(e);
      throw Exception('POST请求失败');
    }
  }
}

// 全局变量，对外提供服务的唯一接口
final httpService = _HttpService();
