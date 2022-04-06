import 'package:flutter/cupertino.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

class MyPlantPage extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  MyPlantPage(
      {required this.debugShowCheckedModeBanner, required this.isIOSPlatform});

  @override
  Widget build(BuildContext context) {
    if (isIOSPlatform) {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        isIOSPlatform: isIOSPlatform,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        index: 4,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MainColorPalettes.colorsThemeMultiple[5],
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /50,
                ),
                Text(
                  '${MainTextPalettes.textFr["MY_PLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[10],
                      fontSize: 50,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height / 55,
                      MediaQuery.of(context).size.height / 35,
                      MediaQuery.of(context).size.height / 55,
                      100,
                    ),
                    child: TextFieldComponent(
                      methode: (test)=>{

                      },
                      text: "${MainTextPalettes.textFr["SEARCH"]}",
                      isValid: true,
                      isNotValidRenderText: 'test',
                      hiddenText: true,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height /10,
                ),
                Text(
                  '${MainTextPalettes.textFr["NOPLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[20],
                      fontSize: 25,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height /10,
                ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height / 6,
              MediaQuery.of(context).size.height / 35,
              MediaQuery.of(context).size.height / 6,
              100,
            ),
                child : ButtonComponent(
                  text: "+",
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, 'qrcode')},

                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[25]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[10]!,
                ),
          )
              ],
            )
        ),
      );
    } else {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        isIOSPlatform: isIOSPlatform,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        index: 4,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MainColorPalettes.colorsThemeMultiple[5],
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /50,
                ),
                Text(
                  '${MainTextPalettes.textFr["MY_PLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[10],
                      fontSize: 50,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height / 55,
                      MediaQuery.of(context).size.height / 35,
                      MediaQuery.of(context).size.height / 55,
                      100,
                    ),
                    child: TextFieldComponent(
                      methode: (test){

                      },
                      hiddenText: true,
                      text:
                      "${MainTextPalettes.textFr["SEARCH"]}",
                      isValid: true,
                      isNotValidRenderText: 'test',
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height /10,
                ),
                Text(
                  '${MainTextPalettes.textFr["NOPLANT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[20],
                      fontSize: 25,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height /10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.height / 6,
                    MediaQuery.of(context).size.height / 35,
                    MediaQuery.of(context).size.height / 6,
                    100,
                  ),
                  child : ButtonComponent(
                    text: "+",
                    enumerateCategoriesButton:
                    EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                    isIOSPlatform: isIOSPlatform,
                    methode: () =>
                    {Navigator.pushNamed(context, 'confirmEmail')},

                    colorBorder:
                    MainColorPalettes.colorsThemeMultiple[25]!,
                    backgroundColorButton:
                    MainColorPalettes.colorsThemeMultiple[10]!,
                  ),
                )
              ],
            )
        ),
      );
    }
  }
}
