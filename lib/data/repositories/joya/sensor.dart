import 'package:flutter/foundation.dart';
import 'package:joya/data/models/sensor.dart';
import '../../services/api/joya/sensor.dart';

class SensorRepository {
  final SensorService _sensorService;

  const SensorRepository({required SensorService sensorService})
      : _sensorService = sensorService;

  Future<List<Sensor>?> fetch() async {
    try {
      return await _sensorService.fetch();
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint(error.toString());
    }
  }
}
