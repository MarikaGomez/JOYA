import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/repositories/joya/sensor.dart';
import 'package:meta/meta.dart';

import '../../../data/models/sensor.dart';
part 'sensors_state.dart';

class SensorsCubit extends Cubit<SensorsState> {
  final SensorRepository sensorRepository;
  List<Sensor> sensors = [];

  List<Sensor> _allSensors = [];
  String searchField = "";
  bool isSubmit = false;
  SensorsCubit({required this.sensorRepository}) : super(SensorsInitial());

  void fetchSensors() async {
    try {
      var responseData = await sensorRepository.fetch();
      if (responseData != null && responseData.isNotEmpty) {
        _allSensors = responseData;
        return emit(SensorsLoaded(sensors: responseData));
      }
      emit(SensorsLoaded(sensors: []));
    } catch (err) {
      print("$err");
    }
  }

  void setSensors(List<Sensor> sensorsData) {
    sensors = sensorsData;
  }

  List<Sensor> removeDuplicateSensorsInList(List<Sensor> sensorDuplicate) {
    for (var indexLoopOne = 0;
        indexLoopOne < sensorDuplicate.length;
        indexLoopOne++) {
      for (var indexLoopTwo = indexLoopOne + 1;
          indexLoopTwo < sensorDuplicate.length;
          indexLoopTwo++) {
        if (sensorDuplicate[indexLoopOne].serial_number ==
            sensorDuplicate[indexLoopTwo].serial_number) {
          sensorDuplicate.removeAt(indexLoopTwo);
          break;
        }
      }
    }
    return sensorDuplicate;
  }

  void setSearchField(String searchField) {
    print("$searchField field");
    var allSensorsCopy = [..._allSensors];
    emit(SensorsSearchState());
    if (searchField.isEmpty) {
      print("${allSensorsCopy} all");
      return emit(SensorsLoaded(sensors: allSensorsCopy));
    }
    List<Sensor> sensorFilterByName = [];
    List<Sensor> sensorFilterBySn = [];

    allSensorsCopy.forEach((sensor) {
      if (sensor.serial_number.contains(searchField))
        sensorFilterBySn.add(sensor);
      if (sensor.name.contains(searchField)) sensorFilterByName.add(sensor);
    });
    print("length ${removeDuplicateSensorsInList([
          ...sensorFilterBySn,
          ...sensorFilterByName
        ]).length}");
    emit(
      SensorsLoaded(
        sensors: removeDuplicateSensorsInList(
            [...sensorFilterBySn, ...sensorFilterByName]),
      ),
    );
  }
}
