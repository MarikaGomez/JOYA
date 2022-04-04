import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/ui/ConfirmationEmail.dart';
import 'package:joya/ui/ErrorPage.dart';
import 'package:joya/ui/InscriptionPage.dart';
import 'package:joya/ui/LandingPage.dart';
import 'package:joya/ui/Login.dart';
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
      },
    );
  }
}

