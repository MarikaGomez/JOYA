import 'package:flutter/material.dart';
import 'package:joya/pages/scan/scan_view.dart';

class QrCodeScanPage2 extends StatelessWidget {
  static String pageName = "scan";

  const QrCodeScanPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: QrCodeScan2(),
    );
  }
}
