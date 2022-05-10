import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/LoginBloc.dart';
import 'package:joya/bloc/bloc_provider.dart';
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
    final bloc = BlocProvider.of<LoginBloc>(context);
    if (this.isIOSPlatform) {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: StreamBuilder<Map<String, dynamic>>(
            stream: bloc?.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return ErrorPage(
                    errorMessage: 'Data is Null',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
                          style: TextStyle(
                              color: MainColorPalettes.colorsThemeMultiple[10],
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSans-Bold.ttf'),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: TextFieldComponent(
                              methode: (data) async {
                                if (data.isValidEmail()) {
                                  bloc?.setIsValidEmail(data.isValidEmail());
                                  bloc?.setByKey("email", data);
                                } else {
                                  bloc?.setIsValidEmail(data.isValidEmail());
                                }
                              },
                              text:
                                  "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: snapshot.data["isValidEmail"],
                              isNotValidRenderText:
                                  "${MainTextPalettes.textFr["ERROR_EMAIL"]}",
                              hiddenText: false,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: TextFieldComponent(
                              methode: (data) async {
                                bloc?.setByKey("password", data);
                              },
                              text:
                                  "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                              hiddenText: true,
                            )),
                        SizedBox(height: 10),
                        ButtonComponent(
                          text: MainTextPalettes
                              .textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                          enumerateCategoriesButton: EnumerateCategoriesButton
                              .typeButtonTextAndIconRight,
                          isIOSPlatform: isIOSPlatform,
                          methode: () async {
                            bloc?.login();
                          },
                          colorBorder:
                              MainColorPalettes.colorsThemeMultiple[10]!,
                          backgroundColorButton:
                              MainColorPalettes.colorsThemeMultiple[10]!,
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\n${MainTextPalettes.textFr["RECUP"]}",
                                  style: TextStyle(
                                      fontFamily: "DMSans-Regular",
                                      fontSize: 15,
                                      color: MainColorPalettes
                                          .colorsThemeMultiple[10]),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, 'about');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return ErrorPage(
                  errorMessage: 'Data is Null',
                  debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                  isIOSPlatform: isIOSPlatform,
                );
              }
            },
          ),
        ),
      );
    } else {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: StreamBuilder<Map<String, dynamic>>(
            stream: bloc?.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return ErrorPage(
                    errorMessage: 'Data is Null',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              } else if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
                          style: TextStyle(
                              color: MainColorPalettes.colorsThemeMultiple[10],
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSans-Bold.ttf'),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: TextFieldComponent(
                              methode: (data) {
                                bloc?.setIsValidEmail(data.isValidEmail());

                                if (data.isValidEmail()) {
                                  bloc?.setIsValidEmail(data.isValidEmail());
                                  bloc?.setByKey("email", data);
                                } else {
                                  bloc?.setIsValidEmail(data.isValidEmail());
                                }
                              },
                              text:
                                  "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: snapshot.data["isValidEmail"],
                              isNotValidRenderText:
                                  "${MainTextPalettes.textFr["BOOLISVALIDMAIL"]}",
                              hiddenText: false,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: TextFieldComponent(
                              methode: (data) async {
                                bloc?.setByKey("password", data);
                              },
                              text:
                                  "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                              hiddenText: true,
                            )),
                        SizedBox(height: 10),
                        Text("${snapshot.data}"),
                        ButtonComponent(
                          text: MainTextPalettes
                              .textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                          enumerateCategoriesButton: EnumerateCategoriesButton
                              .typeButtonTextAndIconRight,
                          isIOSPlatform: isIOSPlatform,
                          methode: () async {
                            bloc?.login();
                          },
                          colorBorder:
                              MainColorPalettes.colorsThemeMultiple[10]!,
                          backgroundColorButton:
                              MainColorPalettes.colorsThemeMultiple[10]!,
                        ),
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "\n${MainTextPalettes.textFr["RECUP"]}",
                                  style: TextStyle(
                                      fontFamily: "DMSans-Regular",
                                      fontSize: 15,
                                      color: MainColorPalettes
                                          .colorsThemeMultiple[10]),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, 'signin');
                                    },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return ErrorPage(
                    errorMessage: 'Data is Null',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              }
            },
          ),
        ),
      );
    }
  }
}
