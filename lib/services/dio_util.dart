// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';

const URL = 'https://dog.ceo/api';

class DioUtil {
  late final Dio dio;

  static DioUtil service = DioUtil._init();

  DioUtil._init() {
    dio = Dio(BaseOptions(
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
      receiveDataWhenStatusError: true,
      baseUrl: URL,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 8),
    ));

    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          try {
            final code = err.response?.statusCode;
            log('ERROR[$code] => PATH: ${err.requestOptions.path}');
          } on Exception catch (_) {
            return handler.reject(err);
          }
          return handler.reject(err);
        },
      ),
    );
  }
}
