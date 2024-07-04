// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import 'package:suiniji/src/commons/constants/configs.dart';
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
        final nonce = const Uuid().v4();

        final headers = {
          'Authorization': 'Bearer $token',
          'Version': version,
          'Ts': '$ts',
          'Os': os,
          'Channel': channel,
          'Nonce': nonce,
        };

        options.headers.addAll(headers);

        final Map<String, dynamic> queryParams = options.queryParameters;
        final Map<String, dynamic> bodyParams = options.data ?? {};

        final others = {
          'method': options.method,
          'uri': options.uri.path,
        };

        final Map<String, dynamic> allParams = {
          'header': headers,
          'query': queryParams,
          'body': bodyParams,
          'other': others,
        };

        logger.d('allParams: $allParams');

        final sortedParams = _sortParams(allParams);

        options.headers['Sign'] = _getSign(sortedParams, Configs.secretKey);

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

  /// 排序参数
  Map<String, dynamic> _sortParams(Map<String, dynamic> params) {
    final sortedKeys = params.keys.toList()..sort();
    final sortedMap = <String, dynamic>{};
    for (final key in sortedKeys) {
      final value = params[key];
      if (value is Map<String, dynamic>) {
        sortedMap[key] = _sortParams(value);
      } else {
        sortedMap[key] = value;
      }
    }
    return sortedMap;
  }

  /// 获取签名
  String _getSign(Map<String, dynamic> sortedParams, String secretKey) {
    final jsonString = json.encode(sortedParams);

    final bytes = utf8.encode(jsonString + secretKey);
    final digest = sha256.convert(bytes);

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
