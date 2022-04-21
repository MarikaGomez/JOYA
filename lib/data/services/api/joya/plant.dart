import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/models/plant.dart';
import 'package:joya/data/services/api/http_service.dart';

import '../../../../common/variables.dart';

class PlantService {
  HttpService _httpService = HttpService();

  Future<List<Plant>?> fetch() async {
    try {
      var responseData = await _httpService.get(url: JOYA_URL + "plants");
      if (responseData == null) return [];
      var responseArray = jsonDecode(responseData) as List;
      var plants = responseArray
          .map((plant) => Plant.fromJson(json.decode(plant.toString())))
          .toList();
      return plants;
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }
}
