import 'package:flutter/material.dart';
import 'package:joya/data/repositories/joya/auth.dart';
import 'package:joya/data/services/api/joya/auth.dart';
import 'package:joya/pages/login/cubit/login_page.dart';
import 'package:joya/pages/scan/cubit/scan_page.dart';
import 'package:joya/pages/sensors/cubit/sensors_page.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/ui/About.dart';
import 'package:joya/ui/ConfirmationEmail.dart';
import 'package:joya/ui/LandingPage.dart';
import 'package:joya/ui/StorePage.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/controller/RequestBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widgets is the root of your application.
  bool debugShowCheckedModeBanner = false;

  AuthRepository authRepository = AuthRepository(authService: AuthService());

  @override
  Widget build(BuildContext context) {
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    Future<bool> checkLoginStatus() async {
      try {
        var authUser = await authRepository.getCurrentUser();
        if (authUser != null) return true;
        return false;
      } catch (error) {
        debugPrint("Error on get current user ${error}");
        return false;
      }
    }

    return FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          // Boolean get Device Platform Android or iOS
          return MaterialApp(
            color: MainColorPalettes.colorsThemeMultiple[5],
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            initialRoute:
                snapshot.hasData ? SensorsPage.pageName : LoginPage2.pageName,
            routes: <String, WidgetBuilder>{
              'landing': (BuildContext context) => LandingPage(),
              LoginPage2.pageName: (BuildContext context) => LoginPage2(),
              ScanPage.pageName: (BuildContext context) => ScanPage(),
              SensorsPage.pageName: (BuildContext context) => SensorsPage(),

              // 'signin': (BuildContext context) => BlocProvider<LoginBloc>(
              //     bloc: LoginBloc(context: context),
              //     child: Login(
              //         isIOSPlatform: isIOS,
              //         debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
              "confirmEmail": (BuildContext context) => ConfirmationEmail(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              "about": (BuildContext context) => About(
                  isIOSPlatform: isIOS,
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              // // "qrcode": (BuildContext context) => QrCode(
              // //     isIOSPlatform: isIOS,
              // //     debugShowCheckedModeBanner: debugShowCheckedModeBanner),
              // 'qrcodeScan': (BuildContext context) => BlocProvider<RequestBloc>(
              //     bloc: RequestBloc(),
              //     child: QrCodeScan(
              //         isIOSPlatform: isIOS,
              //         debugShowCheckedModeBanner: debugShowCheckedModeBanner)),
              // 'homeWithoutSensor': (BuildContext context) =>
              //     BlocProvider<RequestBloc>(
              //         bloc: RequestBloc(),
              //         child: HomeWithoutSensorPage(
              //             isIOSPlatform: isIOS,
              //             debugShowCheckedModeBanner:
              //                 debugShowCheckedModeBanner)),
              //
              // 'myAccount': (BuildContext context) => BlocProvider<RequestBloc>(
              //       bloc: RequestBloc(),
              //       child: MyAccountPage(
              //         isIOSPlatform: isIOS,
              //         debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              //       ),
              //     ),
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
