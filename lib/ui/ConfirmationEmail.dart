import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

class ConfirmationEmail extends StatelessWidget{
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  ConfirmationEmail({required this.debugShowCheckedModeBanner, required this.isIOSPlatform});

  @override
  Widget build(BuildContext context) {
    if(this.isIOSPlatform){
      return Scaffold(
        body: Container(
          color: MainColorPalettes.colorsThemeMultiple[5],
          child: Column(
            children: [

            ],
          ),
        ),
      );
    }else{
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.noCurvedBar,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        isIOSPlatform: isIOSPlatform,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MainColorPalettes.colorsThemeMultiple[5],
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 6,),
              Icon(
                Icons.mark_email_read_rounded,
                color: MainColorPalettes.colorsThemeMultiple[10],
                size: 300.0,
              ),
              Text(
                '${MainTextPalettes.textFr["REGARDEBOITE"]}',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: MainColorPalettes.colorsThemeMultiple[10],
                    fontSize: MediaQuery.of(context).size.height /25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DMSans-Bold.ttf'),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.height / 25,
                    5,
                    MediaQuery.of(context).size.height / 25,
                    5,
                  ),
                child: Text(
                  '${MainTextPalettes.textFr["TEXTSENDEMAIL"]}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[20],
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/15,),
              ButtonComponent(
                text: MainTextPalettes.textFr["OPENMAIL"],
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
              SizedBox(height: MediaQuery.of(context).size.height/25,),
              Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                          "${MainTextPalettes.textFr["TEXT CONFIRM MAIL QUESTION"]}",
                          style: TextStyle(
                              fontFamily: "DMSans-Regular",
                              fontSize: 15,
                              color: MainColorPalettes
                                  .colorsThemeMultiple[20]),
                        ),
                        TextSpan(
                          text:
                          "\n${MainTextPalettes.textFr["QUESTION EMAIL"]}",
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
                      ])))
            ],
          ),
        )
      );
    }
  }
}
