import 'package:flutter/foundation.dart';
import '../../models/plant.dart';
import '../../services/api/joya/plant.dart';

class PlantRepository {
  final PlantService _plantService;

  const PlantRepository({required PlantService plantService})
      : _plantService = plantService;

  Future<List<Plant>?> fetch() async {
    try {
      return await _plantService.fetch();
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<Plant?> findOne(String id) async {
    try {
      return await _plantService.findOne(id);
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint(error.toString());
    }
  }
}
