import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/services/api/http_service.dart';
import '../../../../common/variables.dart';
import '../../../models/sensor-data.dart';

class SensorDataService {
  HttpService _httpService = HttpService();

  Future<List<SensorData>?> fetch(String serialNumber) async {
    try {
      var responseData =
          await _httpService.get(url: JOYA_URL + "sensors-data/$serialNumber");
      if (responseData == null) return [];
      var responseArray = jsonDecode(responseData) as List;
      var sensorsData = responseArray
          .map((sensorData) =>
              SensorData.fromJson(json.decode(sensorData.toString())))
          .toList();
      return sensorsData;
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }
}
