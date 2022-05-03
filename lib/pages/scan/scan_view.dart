import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joya/pages/plant/cubit/sensor_detail_page.dart';
import 'package:joya/pages/scan/cubit/scan_cubit.dart';
import 'package:joya/pages/scan/widgets/add_sensor_form_fields.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../styles/MainTextPalettes.dart';
import '../sensors/cubit/sensors_page.dart';

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({Key? key}) : super(key: key);

  @override
  _QrCodeScanState createState() => _QrCodeScanState();
}

class _QrCodeScanState extends State<QrCodeScan> {
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      context.read<ScanCubit>().controller!.pauseCamera();
    } else if (Platform.isIOS) {
      context.read<ScanCubit>().controller!.resumeCamera();
    }
  }

  updateUI(ScanState state) {
    if (state is ScanSuccess) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SensorsPage()));
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ScanCubit, ScanState>(listener: (context, state) {
        updateUI(state);
      }, builder: (context, state) {
        return SafeArea(
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
      });

  Widget buildQrView(BuildContext context) => QRView(
        key: context.read<ScanCubit>().qrKey,
        onQRViewCreated: context.read<ScanCubit>().onScanQRCode,
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
            borderRadius: BorderRadius.circular(8), color: Colors.white24),
        child: Center(
          child: Text('${MainTextPalettes.textFr["SCAN_QRCODE"]}'),
        ),
      );

  @override
  void dispose() {
    context.read<ScanCubit>().disposeController();
    super.dispose();
  }
}
