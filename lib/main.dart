import 'package:flutter/material.dart';
import 'package:joya/data/repositories/joya/auth.dart';
import 'package:joya/data/services/api/joya/auth.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/ui/About.dart';
import 'package:joya/ui/ConfirmationEmail.dart';
import 'package:joya/ui/HomeWithoutSensorPage.dart';
import 'package:joya/ui/InscriptionPage.dart';
import 'package:joya/ui/LandingPage.dart';
import 'package:joya/ui/Login.dart';
import 'package:joya/ui/MyAccountPage.dart';
import 'package:joya/ui/PlantsPage.dart';
import 'package:joya/ui/QrCode.dart';
import 'package:joya/ui/QrCodeScan.dart';
import 'package:joya/ui/StorePage.dart';
import 'bloc/LoginBloc.dart';
import 'bloc/bloc_provider.dart';
import 'bloc/controller/RequestBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool debugShowCheckedModeBanner = false;

  AuthRepository authRepository = AuthRepository(authService: AuthService());

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var isLogged = true;
    checkLoginStatus() async {
      try {
        await authRepository.getCurrentUser();
      } catch (error) {
        debugPrint("Error on get current user ${error}");
        isLogged = false;
      }
    }

    return FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          // Boolean get Device Platform Android or iOS
          return MaterialApp(
            color: MainColorPalettes.colorsThemeMultiple[5],
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            initialRoute: isLogged ? "myPlant" : 'landing',
            routes: <String, WidgetBuilder>{
              'landing': (BuildContext context) => LandingPage(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              'signup': (BuildContext context) => BlocProvider<RequestBloc>(
                  bloc: RequestBloc(),
                  child: InscriptionPage(
                      isIOSPlatform: isIOS,
                      debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
              'signin': (BuildContext context) => BlocProvider<LoginBloc>(
                  bloc: LoginBloc(context: context),
                  child: Login(
                      isIOSPlatform: isIOS,
                      debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
              "confirmEmail": (BuildContext context) => ConfirmationEmail(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              "about": (BuildContext context) => About(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              "qrcode": (BuildContext context) => QrCode(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              'qrcodeScan': (BuildContext context) => BlocProvider<RequestBloc>(
                  bloc: RequestBloc(),
                  child: QrCodeScan(
                      isIOSPlatform: isIOS,
                      debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
              'homeWithoutSensor': (BuildContext context) =>
                  BlocProvider<RequestBloc>(
                      bloc: RequestBloc(),
                      child: HomeWithoutSensorPage(
                          isIOSPlatform: isIOS,
                          debugShowCheckedModeBanner:
                              debugShowCheckedModeBanner)),
              "myPlant": (BuildContext context) => PlantsPage(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              'myAccount': (BuildContext context) => BlocProvider<RequestBloc>(
                    bloc: RequestBloc(),
                    child: MyAccountPage(
                      isIOSPlatform: isIOS,
                      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    ),
                  ),
              'store': (BuildContext context) => BlocProvider<RequestBloc>(
                    bloc: RequestBloc(),
                    child: StorePage(
                      isIOSPlatform: isIOS,
                      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    ),
                  ),
            },
          );
        });
  }
}
