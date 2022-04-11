import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/extensionType/extendType.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

import '../data/enum/EnumerateCategoriesButton.dart';
import '../data/enum/EnumerateCategoriesScaffold.dart';
import 'ErrorPage.dart';

class Login extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  Login(
      {required this.isIOSPlatform, required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RequestBloc>(context);
    if (this.isIOSPlatform) {
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: StreamBuilder<Map<String, dynamic>>(
                  stream: bloc?.stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner:
                              debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    } else if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                              Text(
                                '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
                                style: TextStyle(
                                    color: MainColorPalettes
                                        .colorsThemeMultiple[10],
                                    fontSize: 60,
                                    fontFamily: 'DMSans-Bold.ttf'),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 25,
                                    MediaQuery.of(context).size.height / 15,
                                    MediaQuery.of(context).size.height / 25,
                                    5,
                                  ),
                                  child: TextFieldComponent(
                                    methode: (data) {
                                      bloc?.setIsValidEmail(
                                          data.isValidEmail());
                                    },
                                    text:
                                        "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                                    isValid: snapshot.data["isValidEmail"],
                                    isNotValidRenderText:
                                        "${MainTextPalettes.textFr["ERROR_EMAIL"]}",
                                    hiddenText: false,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 25,
                                    MediaQuery.of(context).size.height / 50,
                                    MediaQuery.of(context).size.height / 25,
                                    5,
                                  ),
                                  child: TextFieldComponent(
                                    methode: (data) {
                                      print(data);
                                    },
                                    text:
                                        "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                                    isValid: true,
                                    isNotValidRenderText: 'test',
                                    hiddenText: true,
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              ButtonComponent(
                                text: MainTextPalettes.textFr[
                                    "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                                enumerateCategoriesButton:
                                    EnumerateCategoriesButton
                                        .typeButtonTextAndIconRight,
                                isIOSPlatform: isIOSPlatform,
                                methode: () => {
                                  Navigator.pushNamed(
                                      context, 'homeWithoutSensor')
                                },
                                colorBorder:
                                    MainColorPalettes.colorsThemeMultiple[5]!,
                                backgroundColorButton:
                                    MainColorPalettes.colorsThemeMultiple[10]!,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              "\n${MainTextPalettes.textFr["RECUP"]}",
                                          style: TextStyle(
                                              fontFamily: "DMSans-Regular",
                                              fontSize: 15,
                                              color: MainColorPalettes
                                                  .colorsThemeMultiple[10]),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                  context, 'about');
                                            },
                                        ),
                                      ])))
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner:
                              debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    }
                  })));
    } else {
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: StreamBuilder<Map<String, dynamic>>(
                  stream: bloc?.stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner:
                              debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    } else if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                              ),
                              Text(
                                '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
                                style: TextStyle(
                                    color: MainColorPalettes
                                        .colorsThemeMultiple[10],
                                    fontSize: 60,
                                    fontFamily: 'DMSans-Bold.ttf'),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 25,
                                    MediaQuery.of(context).size.height / 15,
                                    MediaQuery.of(context).size.height / 25,
                                    5,
                                  ),
                                  child: TextFieldComponent(
                                    methode: (data) {
                                      bloc?.setIsValidEmail(
                                          data.isValidEmail());
                                    },
                                    text:
                                        "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                                    isValid: snapshot.data["isValidEmail"],
                                    isNotValidRenderText:
                                        "${MainTextPalettes.textFr["BOOLISVALIDMAIL"]}",
                                    hiddenText: false,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.height / 25,
                                    MediaQuery.of(context).size.height / 50,
                                    MediaQuery.of(context).size.height / 25,
                                    5,
                                  ),
                                  child: TextFieldComponent(
                                    methode: (test) => {},
                                    text:
                                        "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                                    isValid: true,
                                    isNotValidRenderText: 'test',
                                    hiddenText: true,
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              ButtonComponent(
                                text: MainTextPalettes.textFr[
                                    "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                                enumerateCategoriesButton:
                                    EnumerateCategoriesButton
                                        .typeButtonTextAndIconRight,
                                isIOSPlatform: isIOSPlatform,
                                methode: () => {
                                  Navigator.pushNamed(
                                      context, 'homeWithoutSensor')
                                },
                                colorBorder:
                                    MainColorPalettes.colorsThemeMultiple[5]!,
                                backgroundColorButton:
                                    MainColorPalettes.colorsThemeMultiple[10]!,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 25,
                              ),
                              Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text:
                                              "\n${MainTextPalettes.textFr["RECUP"]}",
                                          style: TextStyle(
                                              fontFamily: "DMSans-Regular",
                                              fontSize: 15,
                                              color: MainColorPalettes
                                                  .colorsThemeMultiple[10]),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushNamed(
                                                  context, 'signin');
                                            },
                                        ),
                                      ])))
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ErrorPage(
                          errorMessage: 'Data is Null',
                          debugShowCheckedModeBanner:
                              debugShowCheckedModeBanner,
                          isIOSPlatform: isIOSPlatform);
                    }
                  })));
    }
  }
}
