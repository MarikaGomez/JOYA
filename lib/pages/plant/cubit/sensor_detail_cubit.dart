import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/repositories/wiki/wiki-plant.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../../common/variables.dart';
import '../../../data/models/sensor-data.dart';
import '../../../data/models/sensor.dart';
import '../../../data/repositories/joya/sensor.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'sensor_detail_state.dart';

class SensorCubit extends Cubit<SensorState> {
  final SensorRepository sensorRepository;
  final WikiPlantRepository wikiPlantRepository;
  String searchField = "";
  bool isSubmit = false;
  Sensor? sensor;
  String description = "";
  Socket? socketCubit;
  SensorCubit({
    required this.sensorRepository,
    required this.wikiPlantRepository,
  }) : super(SensorInitial());

  void fetchSensor(String id) async {
    try {
      emit(SensorLoading());
      var responseData = await sensorRepository.findOne(id);
      var plantName = responseData?.plant?.name;
      String? plantDescription = await wikiPlantRepository
          .fetchOneDdescriptionByTitle(plantName != null ? plantName : "");
      if (responseData != null) {
        return emit(SensorLoaded(
            sensor: responseData,
            description: plantDescription != null ? plantDescription : ""));
      }
      emit(SensorError(message: "Capteur introuvable"));
    } catch (err) {
      print("error on get Sensor : $err");
      emit(SensorError(message: "Capteur introuvable"));
    }
  }

  void connectAndListen(String serialNumber) {
    IO.Socket socket = IO.io(
        JOYA_SOCKET_URL, OptionBuilder().setTransports(['websocket']).build());
    socket.connect();
    socket.on(
        "connect", (data) => print("socket is connected ${socket.connected}"));
    socket.on(serialNumber, (data) => {res(data)});
    socket.onDisconnect((_) => print('disconnect'));
    socketCubit = socket;
  }

  void res(dynamic data) {
    emit(SensorSocketLoading());

    try {
      SensorData newSensorData = SensorData.fromJson(data);
      print("${newSensorData.humidity} iciiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
      if (sensor != null) {
        sensor?.sensorData = newSensorData;
        emit(SensorLoaded(sensor: sensor!, description: description));
      }
    } on Exception catch (e) {}
  }

  void setSensor(Sensor sensorRes) {
    sensor = sensorRes;
  }

  void setDescription(String value) {
    description = value;
  }

  void disposeSocket() {
    socketCubit?.disconnect();
  }
}
