import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/ui/About.dart';
import 'package:joya/ui/ConfirmationEmail.dart';
import 'package:joya/ui/ErrorPage.dart';
import 'package:joya/ui/HomeWithoutSensorPage.dart';
import 'package:joya/ui/InscriptionPage.dart';
import 'package:joya/ui/LandingPage.dart';
import 'package:joya/ui/Login.dart';
import 'package:joya/ui/MyAccountPage.dart';
import 'package:joya/ui/MyPlantPage.dart';
import 'package:joya/ui/QrCode.dart';
import 'package:joya/ui/QrCodeScan.dart';
import 'package:joya/ui/StorePage.dart';
import 'bloc/bloc_provider.dart';
import 'bloc/controller/RequestBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool debugShowCheckedModeBanner = false;

  @override
  Widget build(BuildContext context) {
    // Boolean get Device Platform Android or iOS
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return MaterialApp(
      color: MainColorPalettes.colorsThemeMultiple[5],
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      initialRoute: 'landing',
      routes: <String, WidgetBuilder>{
        'landing': (BuildContext context) => LandingPage(
            isIOSPlatform: isIOS,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner),
        'signup': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child: InscriptionPage(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
        'signin': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child: Login(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
        "confirmEmail" : (BuildContext context) => ConfirmationEmail(
            isIOSPlatform: isIOS,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner),
        "about" : (BuildContext context) => About(
            isIOSPlatform: isIOS,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner),
        "qrcode" : (BuildContext context) => QrCode(
            isIOSPlatform: isIOS,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner),
        'qrcodeScan': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child:QrCodeScan(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
        'homeWithoutSensor': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child:HomeWithoutSensorPage(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
        "myPlant" : (BuildContext context) => MyPlantPage(
            isIOSPlatform: isIOS,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner),
        'myAccount': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child: MyAccountPage(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
        'store': (BuildContext context) => BlocProvider<RequestBloc>(
            bloc: RequestBloc(),
            child: StorePage(
                isIOSPlatform: isIOS,
                debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
      },
    );
  }
}

