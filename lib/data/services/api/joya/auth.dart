import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:joya/data/services/api/http_service.dart';
import 'package:joya/data/services/device/local_storage_service.dart';

class AuthService {
  HttpService _httpService = HttpService();
  LocalStorageService _localStorageService = LocalStorageService();

  static const JOYA_URL = "http://lejeunedeveloppeur.fr:5000/api/";
  Future<void> login({required String email, required String password}) async {
    var data = {"email": email, "password": password};
    Response response =
        await _httpService.post(url: JOYA_URL + "login", data: data);

    if (response.data == null) {
      throw Exception('BarException');
    }

    if (response.data["accessToken"] == null) {
      throw Exception(response.data);
    }

    _localStorageService.setString(
        LocalStorageService.cookies, response.data["accessToken"]);
  }
}
