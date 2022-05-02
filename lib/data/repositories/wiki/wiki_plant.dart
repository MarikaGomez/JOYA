import 'package:flutter/cupertino.dart';
import 'package:joya/data/services/api/wipedia/wiki_plant.dart';

class WikiPlantRepository {
  final ServiceWikipediaPlant serviceWikipediaPlant;
  WikiPlantRepository({required this.serviceWikipediaPlant});
  Future<String?> fetchOneDdescriptionByTitle(String title) async {
    try {
      return await this
          .serviceWikipediaPlant
          .fetchOneDdescriptionByTitle(title);
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint(error.toString());
    }
  }
}
