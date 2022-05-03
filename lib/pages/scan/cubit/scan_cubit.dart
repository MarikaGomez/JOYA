import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../data/services/api/joya/sensor.dart';
part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final SensorService sensorService;
  String data = "";
  bool isSubmit = false;
  ScanCubit({required this.sensorService}) : super(ScanInitial());

  void setIsValidQrCodeData(bool newInstance) {}

  void getCurrentSensor() async {
    try {
      var sensor = await sensorService;
      if (sensor != null) {
        return emit(ScanSuccess());
      }
      emit(ScanLoaded());
    } catch (err) {
      emit(ScanLoaded());
      print("$err");
    }
  }

  void login() async {
    try {
      emit(ScanLoadingSubmit());
      isSubmit = true;
      var res = await sensorService.findOne(data);
      if (res != null) return emit(ScanSuccess());
      emit(ScanError(message: "Une erreur est survenue."));
    } catch (error) {
      emit(ScanError(message: "Une erreur est survenue."));
    }
  }

  void setData(String value) {
    data = value.trim();
  }
}
