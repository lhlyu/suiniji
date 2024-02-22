// Dart imports:
import 'dart:collection';
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/strings.dart';
import 'package:suiniji/src/commons/log/log.dart';
import 'package:suiniji/src/services/result.dart';

class HttpService {
  late final Dio _dio;

  /// 初始化Dio实例并配置
  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://busy-lobster-82.deno.dev/api',
        connectTimeout: const Duration(seconds: 5),
        contentType: 'application/json; charset=utf-8',
      ),
    );

    if (!kReleaseMode) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        requestHeader: true,
        error: true,
      ));
    }

    /// 添加拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      /// 请求拦截器
      onRequest: (options, handler) {
        const token = "";
        const version = "1.0.0";
        final ts = DateTime.now().millisecondsSinceEpoch;
        const os = "android";
        const channel = "test";
        const nonce = 123;

        options.headers['Authorization'] = 'Bearer $token';
        options.headers['Version'] = version;
        options.headers['Ts'] = '$ts';
        options.headers['Os'] = os;
        options.headers['Channel'] = channel;
        options.headers['Nonce'] = '$nonce';

        final header = "$token$version$ts$os$channel$nonce";

        options.headers['Sign'] = _getSign(header, options);

        return handler.next(options);
      },

      /// 响应拦截器
      onResponse: (response, handler) {
        if (response.statusCode! >= 200 && response.statusCode! < 400) {
          return handler.next(response);
        }

        handler.reject(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: "${response.statusCode}: ${response.statusMessage}",
        ));
      },

      /// 统一的错误处理
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    ));
  }

  /// 获取签名
  String _getSign(String headerStr, RequestOptions options) {
    final params = options.queryParameters;
    final data = options.data;

    // 将params按键排序并转换为字符串
    final sortedParams = SplayTreeMap<String, dynamic>.from(params);
    final paramsStr = sortedParams.keys.map((key) => '$key=${sortedParams[key]}').join('&');

    // 将data转换为字符串
    final dataStr = data is Map ? json.encode(SplayTreeMap<String, dynamic>.from(data)) : data.toString();

    final s = '${Strings.appName}${options.method}$headerStr$paramsStr$dataStr';

    final content = const Utf8Encoder().convert(s);
    final digest = md5.convert(content);

    return hex.encode(digest.bytes);
  }

  Future<Result> get(String uri, {Map<String, dynamic>? params, Options? options}) async {
    try {
      final response = await _dio.get(uri, queryParameters: params);
      final r = Result.fromJson(response.data);
      return r;
    } on DioException catch (e) {
      logger.e('GET:$uri, $params, $e');
      return const Result(code: -1, msg: "请求异常");
    }
  }

  Future<Result> post(String uri, {Map<String, dynamic>? data, Options? options}) async {
    try {
      final response = await _dio.post(uri, data: data);
      final r = Result.fromJson(response.data);
      return r;
    } on DioException catch (e) {
      logger.e('POST:$uri, $data, $e');
      return const Result(code: -2, msg: "请求异常");
    }
  }
}

final httpService = HttpService();
