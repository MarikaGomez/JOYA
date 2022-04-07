import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

import 'ErrorPage.dart';

class HomeWithoutSensorPage extends StatelessWidget{
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  HomeWithoutSensorPage({required this.isIOSPlatform,required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RequestBloc>(context);

    if (this.isIOSPlatform) {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        isIOSPlatform: isIOSPlatform,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        index: 0,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MainColorPalettes.colorsThemeMultiple[5],
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50), // TO DO
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: MainColorPalettes.colorsThemeMultiple[5],
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/joyalogo.png',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          scale: 0.8,
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${MainTextPalettes.textFr["NOPLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[20],
                      fontSize: 25,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
                SizedBox(height: 15,),
                Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\n${MainTextPalettes.textFr["ADDFIRSTPLANT"]}",
                                style: TextStyle(
                                    fontFamily: "DMSans-Regular",
                                    fontSize: 25,
                                    color: MainColorPalettes.colorsThemeMultiple[20]
                                ),
                              ),
                            ]
                        )
                    )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(190, 50, 0, 0), // TO DO
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                        text: MainTextPalettes.textFr[
                        "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                        enumerateCategoriesButton:
                        EnumerateCategoriesButton
                            .typeButtonIconOnly,
                        isIOSPlatform: isIOSPlatform,
                        methode: () async =>
                        { await Future.delayed(const Duration(milliseconds: 1000), (){
                          Navigator.pushNamed(context, 'qrcode');
                        })},
                        colorBorder:
                        MainColorPalettes.colorsThemeMultiple[5]!,
                        backgroundColorButton:
                        MainColorPalettes.colorsThemeMultiple[10]!,
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      );
    } else {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        isIOSPlatform: isIOSPlatform,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        index: 0,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MainColorPalettes.colorsThemeMultiple[5],
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 50), // TO DO
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: MainColorPalettes.colorsThemeMultiple[5],
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          'assets/images/joyalogo.png',
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          scale: 0.8,
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${MainTextPalettes.textFr["NOPLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[20],
                      fontSize: 25,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
                SizedBox(height: 15,),
                Center(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\n${MainTextPalettes.textFr["ADDFIRSTPLANT"]}",
                                style: TextStyle(
                                    fontFamily: "DMSans-Regular",
                                    fontSize: 16,
                                    color: MainColorPalettes.colorsThemeMultiple[20]
                                ),
                              ),
                            ]
                        )
                    )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(170, 50, 0, 0), // TO DO
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                        text: MainTextPalettes.textFr[
                        "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                        enumerateCategoriesButton:
                        EnumerateCategoriesButton
                            .typeButtonIconOnly,
                        isIOSPlatform: isIOSPlatform,
                        methode: () async =>
                        {
                        await Future.delayed(const Duration(milliseconds: 1000), (){
                          Navigator.pushNamed(context, 'qrcode');
                        })

                        },
                        colorBorder:
                        MainColorPalettes.colorsThemeMultiple[5]!,
                        backgroundColorButton:
                        MainColorPalettes.colorsThemeMultiple[10]!,
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      );
    }
  }
}
