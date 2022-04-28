import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/models/sensor.dart';
import 'package:joya/data/services/api/http_service.dart';

import '../../../../common/variables.dart';

class SensorService {
  HttpService _httpService = HttpService();

  Future<List<Sensor>?> fetch() async {
    try {
      Response responseData = await _httpService.get(url: JOYA_URL + "sensors");
      if (responseData.data == null) return [];

      var sensors = (responseData.data as List)
          .map((sensor) => Sensor.fromJson(sensor))
          .toList();
      return sensors;
    } on Exception catch (err) {
      debugPrint(" error$err");

      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }
}
