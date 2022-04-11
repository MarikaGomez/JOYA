import 'dart:io';

import 'package:dio/dio.dart';

class HttpService extends HttpOverrides {
  final BaseOptions _requestOptionsInit = BaseOptions(connectTimeout: 5000);

  Future<BaseOptions> _setRequestOptionsWithHeaders(
      {required Map<String, dynamic>? headers}) async {
    return BaseOptions(
      connectTimeout: 5000,
      headers: headers,
    );
  }

  Future<Dio> _initDio({Map<String, dynamic>? headers}) async {
    HttpOverrides.global = this;
    var options = _requestOptionsInit;
    if (headers != null) {
      options = await _setRequestOptionsWithHeaders(headers: headers);
    }
    return Dio(options);
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    Dio dio = await _initDio(headers: headers);
    return await dio.get(url);
  }

  Future<Response> post({
    required String url,
    required FormData data,
    Map<String, dynamic>? headers,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio(headers: headers);
    return await dio.post(
      url,
      data: data,
      onSendProgress: onSendProgressCallback,
    );
  }

  Future<Response> put({
    required String url,
    required FormData data,
    Map<String, dynamic>? headers,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio(headers: headers);
    return await dio.put(
      url,
      data: data,
      onSendProgress: onSendProgressCallback,
    );
  }

  Future<Response> delete({
    required String url,
    required FormData data,
    Map<String, dynamic>? headers,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio(headers: headers);
    return await dio.delete(
      url,
    );
  }
}
