import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/repositories/wiki/wiki_plant.dart';
import '../../../data/models/sensor.dart';
import '../../../data/repositories/joya/sensor.dart';

part 'sensor_detail_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorRepository sensorRepository;
  final WikiPlantRepository wikiPlantRepository;
  String searchField = "";
  bool isSubmit = false;
  SensorCubit(
      {required this.sensorRepository, required this.wikiPlantRepository})
      : super(SensorInitial());

  void fetchSensor(String id) async {
    try {
      var responseData = await sensorRepository.findOne(id);
      var plantName = responseData?.plant.name;
      String? plantDescription = await wikiPlantRepository
          .fetchOneDdescriptionByTitle(plantName != null ? plantName : "");
      if (responseData != null) {
        return emit(SensorLoaded(
            sensor: responseData,
            description: plantDescription != null ? plantDescription : ""));
      }
      emit(SensorError(message: "Sensore introuvable"));
    } catch (err) {
      print("error on get Sensor : $err");
      emit(SensorError(message: "Sensore introuvable"));
    }
  }
}
