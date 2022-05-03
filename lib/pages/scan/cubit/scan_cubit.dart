import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../data/services/api/joya/sensor.dart';
part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  final SensorService sensorService;
  bool isSubmit = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  ScanCubit({required this.sensorService}) : super(ScanInitial());

  void onScanQRCode(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      String result = scanData.code.toString();
      if (result != null) {
        disposeController();
        print(result);
        return emit(ScanSuccess(result: result));
      }
      emit(ScanError(message: "Une erreur est survenue."));
    });
}

void disposeController() {
    controller?.dispose();
}

void setIsValidQrCodeData(bool newInstance) {}
}
