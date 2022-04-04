import 'package:flutter/material.dart';
import 'package:joya/ui/ErrorPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  bool debugShowCheckedModeBanner = false;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Boolean get Device Platform Android or iOS
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return MaterialApp(
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        initialRoute: "test-error",
        routes: <String, WidgetBuilder>{
          "test-error": (BuildContext context) => ErrorPage(
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            errorMessage: 'Error',
            isIOSPlatform : isIOS
          )
        });
  }
}

