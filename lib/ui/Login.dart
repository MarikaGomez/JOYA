import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

import 'ErrorPage.dart';

class Login extends StatelessWidget{
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  Login({required this.isIOSPlatform,required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RequestBloc>(context);
    if (this.isIOSPlatform) {
      return Scaffold(
        body: StreamBuilder<Map<String, dynamic>>(
            stream: bloc?.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return ErrorPage(
                    errorMessage: 'Data is Null',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              } else if (snapshot.hasData) {
                return Container(
                    color: MainColorPalettes.colorsThemeMultiple[5],
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 60, 40, 90), // TO DO
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
                                methode: () =>
                                {Navigator.pushNamed(context, 'landing')},
                                colorBorder:
                                MainColorPalettes.colorsThemeMultiple[5]!,
                                backgroundColorButton:
                                MainColorPalettes.colorsThemeMultiple[10]!,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
                          style: TextStyle(
                              color: MainColorPalettes.colorsThemeMultiple[10],
                              fontSize: 50,
                              fontFamily: 'DMSans-Bold.ttf'),
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 85, 40, 15),
                            child: TextFieldComponent(
                              methode: "test",
                              text:
                              "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 15),
                            child: TextFieldComponent(
                              methode: "test",
                              text:
                              "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                              isValid: true,
                              isNotValidRenderText: 'test',
                            )),
                        ButtonComponent(
                          text: MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                          enumerateCategoriesButton:
                          EnumerateCategoriesButton.typeButtonTextAndIconRight,
                          isIOSPlatform: isIOSPlatform,
                          methode: () =>
                          {Navigator.pushNamed(context, 'signup')},
                          colorBorder:
                          MainColorPalettes.colorsThemeMultiple[5]!,
                          backgroundColorButton:
                          MainColorPalettes.colorsThemeMultiple[10]!,
                        ),
                        SizedBox(height: 15,),
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
                                            color: MainColorPalettes.colorsThemeMultiple[10]
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {print("Condition");},
                                      ),
                                    ]
                                )
                            )
                        )
                      ],
                    ));
              } else {
                return ErrorPage(
                    errorMessage: 'Data is Bad',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              }
            }),
      );
    } else {
      return Container();
    }
  }
}
