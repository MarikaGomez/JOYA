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
import 'package:joya/ui/ErrorPage.dart';

class InscriptionPage extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  InscriptionPage(
      {required this.debugShowCheckedModeBanner, required this.isIOSPlatform});

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
                return ErrorPage(
                    errorMessage: 'Data is Bad',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              } else {
                return ErrorPage(
                    errorMessage: 'Data is Bad',
                    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
                    isIOSPlatform: isIOSPlatform);
              }
            }),
      );
    } else {
      return ScaffoldComponent(
          enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
          isIOSPlatform: isIOSPlatform,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          child: Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Container(
                      color: MainColorPalettes.colorsThemeMultiple[5],
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 18,
                          ),
                          Text(
                            '${MainTextPalettes.textFr["INSCRIPTION"]}',
                            style: TextStyle(
                                color:
                                    MainColorPalettes.colorsThemeMultiple[10],
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
                                methode: "test",
                                text:
                                    "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
                                isValid: true,
                                isNotValidRenderText: 'test',
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height / 25,
                                5,
                                MediaQuery.of(context).size.height / 25,
                                5,
                              ),
                              child: TextFieldComponent(
                                methode: "test",
                                text:
                                    "${MainTextPalettes.textFr["NAME_LABEL_DEFAULT_TEXTFIELD"]}",
                                isValid: true,
                                isNotValidRenderText: 'test',
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height / 25,
                                5,
                                MediaQuery.of(context).size.height / 25,
                                5,
                              ),
                              child: TextFieldComponent(
                                methode: "test",
                                text:
                                    "${MainTextPalettes.textFr["SURNAME_LABEL_DEFAULT_TEXTFIELD"]}",
                                isValid: true,
                                isNotValidRenderText: 'test',
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height / 25,
                                5,
                                MediaQuery.of(context).size.height / 25,
                                5,
                              ),
                              child: TextFieldComponent(
                                methode: "test",
                                text:
                                    "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                                isValid: true,
                                isNotValidRenderText: 'test',
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.height / 25,
                                5,
                                MediaQuery.of(context).size.height / 25,
                                15,
                              ),
                              child: TextFieldComponent(
                                methode: "test",
                                text:
                                    "${MainTextPalettes.textFr["CONFIRMATION_PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
                                isValid: true,
                                isNotValidRenderText: 'test',
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 25,
                          ),
                          ButtonComponent(
                            text: MainTextPalettes.textFr["INSCRIPTION"],
                            enumerateCategoriesButton:
                                EnumerateCategoriesButton.typeButtonTextOnly,
                            isIOSPlatform: isIOSPlatform,
                            methode: () =>
                                {Navigator.pushNamed(context, 'confirmEmail')},
                            colorBorder:
                                MainColorPalettes.colorsThemeMultiple[5]!,
                            backgroundColorButton:
                                MainColorPalettes.colorsThemeMultiple[10]!,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:
                                          "${MainTextPalettes.textFr["PLUSINFO"]}",
                                      style: TextStyle(
                                          fontFamily: "DMSans-Regular",
                                          fontSize: 15,
                                          color: MainColorPalettes
                                              .colorsThemeMultiple[20]),
                                    ),
                                    TextSpan(
                                      text:
                                          "\n${MainTextPalettes.textFr["CONDITIONURL"]}",
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
                                  ])))
                        ],
                      )))));
      // return ScaffoldComponent(
      //   isIOSPlatform: isIOSPlatform,
      //   debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      //   enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
      //   child:
      //   StreamBuilder<Map<String, dynamic>>(
      //       stream: bloc?.stream,
      //       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //         if (snapshot.data == null) {
      //           return ErrorPage(
      //               errorMessage: 'Data is Null',
      //               debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      //               isIOSPlatform: isIOSPlatform);
      //         } else if (snapshot.hasData) {
      //           return Container(
      //               color: MainColorPalettes.colorsThemeMultiple[5],
      //               child:
      //               Column(
      //                 children: [
      //                   SizedBox(height: MediaQuery.of(context).size.height /10,),
      //                   Text(
      //                     '${MainTextPalettes.textFr["INSCRIPTION"]}',
      //                     style: TextStyle(
      //                         color: MainColorPalettes.colorsThemeMultiple[10],
      //                         fontSize: 60,
      //                         fontFamily: 'DMSans-Bold.ttf'),
      //                   ),
      //                   Padding(
      //                       padding: EdgeInsets.fromLTRB(
      //                         MediaQuery.of(context).size.height / 25,
      //                         MediaQuery.of(context).size.height / 15,
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                       ),
      //                       child: TextFieldComponent(
      //                         methode: "test",
      //                         text:
      //                             "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
      //                         isValid: true,
      //                         isNotValidRenderText: 'test',
      //                       )),
      //                   Padding(
      //                       padding: EdgeInsets.fromLTRB(
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                       ),
      //                       child: TextFieldComponent(
      //                         methode: "test",
      //                         text:
      //                             "${MainTextPalettes.textFr["NAME_LABEL_DEFAULT_TEXTFIELD"]}",
      //                         isValid: true,
      //                         isNotValidRenderText: 'test',
      //                       )),
      //                   Padding(
      //                       padding: EdgeInsets.fromLTRB(
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                       ),
      //                       child: TextFieldComponent(
      //                         methode: "test",
      //                         text:
      //                             "${MainTextPalettes.textFr["SURNAME_LABEL_DEFAULT_TEXTFIELD"]}",
      //                         isValid: true,
      //                         isNotValidRenderText: 'test',
      //                       )),
      //                   Padding(
      //                       padding: EdgeInsets.fromLTRB(
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                       ),
      //                       child: TextFieldComponent(
      //                         methode: "test",
      //                         text:
      //                             "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
      //                         isValid: true,
      //                         isNotValidRenderText: 'test',
      //                       )),
      //                   Padding(
      //                       padding: EdgeInsets.fromLTRB(
      //                         MediaQuery.of(context).size.height / 25,
      //                         5,
      //                         MediaQuery.of(context).size.height / 25,
      //                         15,
      //                       ),
      //                       child: TextFieldComponent(
      //                         methode: "test",
      //                         text:
      //                             "${MainTextPalettes.textFr["CONFIRMATION_PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
      //                         isValid: true,
      //                         isNotValidRenderText: 'test',
      //                       )),
      //                   SizedBox(height: MediaQuery.of(context).size.height/25,),
      //                   ButtonComponent(
      //                     text: MainTextPalettes.textFr["INSCRIPTION"],
      //                     enumerateCategoriesButton:
      //                         EnumerateCategoriesButton.typeButtonTextOnly,
      //                     isIOSPlatform: isIOSPlatform,
      //                     methode: () =>
      //                         {Navigator.pushNamed(context, 'confirmEmail')},
      //                     colorBorder:
      //                         MainColorPalettes.colorsThemeMultiple[5]!,
      //                     backgroundColorButton:
      //                         MainColorPalettes.colorsThemeMultiple[10]!,
      //                   ),
      //                   SizedBox(
      //                     height: 15,
      //                   ),
      //                   Center(
      //                       child: RichText(
      //                           textAlign: TextAlign.center,
      //                           text: TextSpan(children: [
      //                             TextSpan(
      //                               text:
      //                                   "${MainTextPalettes.textFr["PLUSINFO"]}",
      //                               style: TextStyle(
      //                                   fontFamily: "DMSans-Regular",
      //                                   fontSize: 15,
      //                                   color: MainColorPalettes
      //                                       .colorsThemeMultiple[20]),
      //                             ),
      //                             TextSpan(
      //                               text:
      //                                   "\n${MainTextPalettes.textFr["CONDITIONURL"]}",
      //                               style: TextStyle(
      //                                   fontFamily: "DMSans-Regular",
      //                                   fontSize: 15,
      //                                   color: MainColorPalettes
      //                                       .colorsThemeMultiple[10]),
      //                               recognizer: TapGestureRecognizer()
      //                                 ..onTap = () {
      //                                   print("Condition");
      //                                 },
      //                             ),
      //                           ])))
      //                 ],
      //               ));
      //         else {
      //           return ErrorPage(
      //               errorMessage: 'Data is Bad',
      //               debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      //               isIOSPlatform: isIOSPlatform);
      //         }

    }
  }
}
