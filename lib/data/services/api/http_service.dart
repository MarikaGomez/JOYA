import 'dart:io';

import 'package:dio/dio.dart';
import 'package:joya/data/services/device/local_storage_service.dart';

class HttpService extends HttpOverrides {
  LocalStorageService localStorageService = LocalStorageService();

  final BaseOptions _requestOptionsInit = BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 13000,
  );

  Future<BaseOptions> setCookies(BaseOptions options) async {
    var cookies =
        await localStorageService.getString(LocalStorageService.cookies);
    if (cookies != null)
      options.headers["cookies"] = {LocalStorageService.cookies: cookies};
    return options;
  }

  Future<Dio> _initDio() async {
    HttpOverrides.global = this;
    var options = _requestOptionsInit;
    options = await setCookies(options);
    return Dio(options);
  }

  Future<Response> get({
    required String url,
  }) async {
    Dio dio = await _initDio();
    return await dio.get(url);
  }

  Future<Response> post({
    required String url,
    required dynamic data,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio();
    return await dio.post(
      url,
      data: data,
      onSendProgress: onSendProgressCallback,
    );
  }

  Future<Response> put({
    required String url,
    required dynamic data,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio();
    return await dio.put(
      url,
      data: data,
      onSendProgress: onSendProgressCallback,
    );
  }

  Future<Response> delete({
    required String url,
    required dynamic data,
    Map<String, dynamic>? headers,
    Function(int, int)? onSendProgressCallback,
  }) async {
    Dio dio = await _initDio();
    return await dio.delete(
      url,
    );
  }
}
