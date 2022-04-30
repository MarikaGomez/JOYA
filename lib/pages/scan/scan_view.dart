import 'dart:io';
import 'package:flutter/material.dart';
import 'package:joya/pages/scan/widgets/add_sensor_form_fields.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../styles/MainTextPalettes.dart';

class QrCodeScan2 extends StatefulWidget {
  const QrCodeScan2({Key? key}) : super(key: key);

  @override
  _QrCodeScan2State createState() => _QrCodeScan2State();
}

class _QrCodeScan2State extends State<QrCodeScan2> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 15, child: buildResult())
        ],
      ),
    ),
  );

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: _onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: Theme.of(context).highlightColor,
      borderRadius: 10,
      borderLength: 20,
      borderWidth: 10,
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
    ),
  );

  Widget buildResult() => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white24
    ),
    child: Center(
      child: (result != null)
          ? Text(
          'Data: ${result!.code}',
          style: const TextStyle(
              fontSize: 9.0
          ))
          : Text('${MainTextPalettes.textFr["SCAN_QRCODE"]}'),

    ),
  );

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddSensorFields(result: result)
            )
        );
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
