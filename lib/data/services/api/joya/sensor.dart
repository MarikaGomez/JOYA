import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/models/sensor.dart';
import 'package:joya/data/services/api/http_service.dart';

import '../../../../common/variables.dart';

class SensorService {
  HttpService _httpService = HttpService();

  Future<List<Sensor>?> fetch() async {
    try {
      var responseData = await _httpService.get(url: JOYA_URL + "sensors");
      if (responseData == null) return [];
      var responseArray = jsonDecode(responseData) as List;
      var sensors = responseArray
          .map((sensor) => Sensor.fromJson(json.decode(sensor.toString())))
          .toList();
      return sensors;
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }
}
