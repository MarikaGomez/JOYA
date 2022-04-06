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
import 'package:joya/styles/MainIconsPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

import 'ErrorPage.dart';

class QrCode extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  QrCode(
      {required this.isIOSPlatform, required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    bool change = true;
    final bloc = BlocProvider.of<RequestBloc>(context);
    if (this.isIOSPlatform) {
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          index: 2,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                      color: MainColorPalettes.colorsThemeMultiple[5],
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          Text(
                            '${MainTextPalettes.textFr["CONNECT_PLANT"]}',
                            style: TextStyle(
                                color:
                                MainColorPalettes.colorsThemeMultiple[10],
                                fontSize: 40,
                                fontFamily: 'DMSans-Bold.ttf'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 15,
                                0,
                                MediaQuery.of(context).size.width / 15,
                                0),
                            child: ButtonComponent(
                              text: MainTextPalettes
                                  .textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                              enumerateCategoriesButton:
                              EnumerateCategoriesButton
                                  .typeBigButtonIconQRcode,
                              isIOSPlatform: isIOSPlatform,
                              methode: () => {
                                Navigator.pushNamed(context, 'qrcodeScan')
                              },
                              colorBorder:
                              MainColorPalettes.colorsThemeMultiple[5]!,
                              backgroundColorButton:
                              MainColorPalettes.colorsThemeMultiple[5]!,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 15,
                                0,
                                MediaQuery.of(context).size.width / 15,
                                0),
                            child: Text(
                              "\n${MainTextPalettes.textFr["SCAN_QRCODE"]}",
                              style: TextStyle(
                                  color:
                                  MainColorPalettes.colorsThemeMultiple[20],
                                  fontSize: 18,
                                  fontFamily: 'DMSans-Bold.ttf'),
                            ),
                          )
                        ],
                      )))));
    } else {
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          index: 2,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                      color: MainColorPalettes.colorsThemeMultiple[5],
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                          ),
                          Text(
                            '${MainTextPalettes.textFr["CONNECT_PLANT"]}',
                            style: TextStyle(
                                color:
                                    MainColorPalettes.colorsThemeMultiple[10],
                                fontSize: 40,
                                fontFamily: 'DMSans-Bold.ttf'),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 15,
                                0,
                                MediaQuery.of(context).size.width / 15,
                                0),
                            child: ButtonComponent(
                              text: MainTextPalettes
                                  .textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                              enumerateCategoriesButton:
                                  EnumerateCategoriesButton
                                      .typeBigButtonIconQRcode,
                              isIOSPlatform: isIOSPlatform,
                              methode: () => {
                                Navigator.pushNamed(context, 'qrcodeScan')
                              },
                              colorBorder:
                                  MainColorPalettes.colorsThemeMultiple[5]!,
                              backgroundColorButton:
                                  MainColorPalettes.colorsThemeMultiple[5]!,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width / 15,
                                0,
                                MediaQuery.of(context).size.width / 15,
                                0),
                            child: Text(
                              "\n${MainTextPalettes.textFr["SCAN_QRCODE"]}",
                              style: TextStyle(
                                  color:
                                      MainColorPalettes.colorsThemeMultiple[20],
                                  fontSize: 18,
                                  fontFamily: 'DMSans-Bold.ttf'),
                            ),
                          )
                        ],
                      )))));
    }
  }
}
