import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/models/sensor.dart';
import '../../../data/repositories/joya/sensor.dart';

part 'sensor_detail_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorRepository sensorRepository;
  String searchField = "";
  bool isSubmit = false;
  SensorCubit({required this.sensorRepository}) : super(SensorInitial());

  void fetchSensor(String id) async {
    try {
      var responseData = await sensorRepository.findOne(id);
      if (responseData != null) {
        return emit(SensorLoaded(sensor: responseData));
      }
      emit(SensorError(message: "Sensore introuvable"));
    } catch (err) {
      print("error on get Sensor : $err");
      emit(SensorError(message: "Sensore introuvable"));
    }
  }
}
