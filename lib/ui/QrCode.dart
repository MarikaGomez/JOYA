// import 'package:flutter/material.dart';
// import 'package:joya/component/ScaffoldComponent.dart';
// import 'package:joya/styles/MainColorPalettes.dart';
// import 'package:joya/styles/MainTextPalettes.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../data/enum/EnumerateCategoriesScaffold.dart';
//
// class QrCode extends StatelessWidget {
//   final bool debugShowCheckedModeBanner;
//   final bool isIOSPlatform;
//
//   QrCode(
//       {required this.isIOSPlatform, required this.debugShowCheckedModeBanner});
//
//   @override
//   Widget build(BuildContext context) {
//     if (this.isIOSPlatform) {
//       return ScaffoldComponent(
//           enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
//           isIOSPlatform: isIOSPlatform,
//           debugShowCheckedModeBanner: debugShowCheckedModeBanner,
//           index: 2,
//           child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: SingleChildScrollView(
//                   child: QrCodeScanPage(
//                       debugShowCheckedModeBanner: debugShowCheckedModeBanner,
//                       platformBool: isIOSPlatform))));
//     } else {
//       return ScaffoldComponent(
//           enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
//           isIOSPlatform: isIOSPlatform,
//           debugShowCheckedModeBanner: debugShowCheckedModeBanner,
//           index: 2,
//           child: QrCodeScanPage(
//               debugShowCheckedModeBanner: debugShowCheckedModeBanner,
//               platformBool: isIOSPlatform));
//     }
//   }
// }
//
// class QrCodeScanPage extends StatefulWidget {
//   final bool debugShowCheckedModeBanner;
//   final bool platformBool;
//
//   QrCodeScanPage(
//       {Key? key,
//       required this.debugShowCheckedModeBanner,
//       required this.platformBool})
//       : super(key: key);
//
//   @override
//   State<QrCodeScanPage> createState() =>
//       _QrCodeScanPageState(this.platformBool);
// }
//
// class _QrCodeScanPageState extends State<QrCodeScanPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//   final bool platformBool;
//
//   _QrCodeScanPageState(bool this.platformBool);
//
//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (!this.platformBool) {
//       controller!.pauseCamera();
//     } else if (this.platformBool) {
//       controller!.resumeCamera();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) => SafeArea(
//         child: Scaffold(
//           body: Stack(
//             alignment: Alignment.center,
//             children: <Widget>[
//               buildQrView(context),
//               Positioned(
//                   bottom: MediaQuery.of(context).size.height / 10,
//                   child: buildResult())
//             ],
//           ),
//         ),
//       );
//
//   Widget buildQrView(BuildContext context) => QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//         overlay: QrScannerOverlayShape(
//           borderColor: Theme.of(context).highlightColor,
//           borderRadius: 10,
//           borderLength: 20,
//           borderWidth: 10,
//           cutOutSize: MediaQuery.of(context).size.width * 0.8,
//         ),
//       );
//
//   Widget buildResult() => Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: MainColorPalettes.colorsThemeMultiple[40]),
//         child: Center(
//           child: (result != null)
//               ? Text('Data: ${result!.code}',
//                   style: const TextStyle(fontSize: 9.0))
//               : Text('${MainTextPalettes.textFr["SCANMESSAGE"]}'),
//         ),
//       );
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//         print(result);
//         // Navigator.pushNamed(context, 'about',arguments: result!.code.toString());
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
