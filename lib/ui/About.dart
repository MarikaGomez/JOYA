import 'package:flutter/cupertino.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

class About extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  About(
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
                  height: MediaQuery.of(context).size.height /10,
                ),
                Text(
                  '${MainTextPalettes.textFr["ABOUT"]}',
                  style: TextStyle(
                      color: MainColorPalettes.colorsThemeMultiple[10],
                      fontSize: 50,
                      fontFamily: 'DMSans-Bold.ttf'),
                ),
                SizedBox(height: 90,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUTPRENIUM"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, '')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                ),
                SizedBox(height: 30,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUTNOTIF"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, '')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                ),
                SizedBox(height: 30,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUT_MY_ACCOUNT"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, 'myAccount')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                ),
                SizedBox(height: 30,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUT_SETTING"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, '')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                ),
                SizedBox(height: 30,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUT_HELP"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, '')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                ),
                SizedBox(height: 30,),
                ButtonComponent(
                  text: MainTextPalettes.textFr["ABOUT_JOYA"],
                  enumerateCategoriesButton:
                  EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                  isIOSPlatform: isIOSPlatform,
                  methode: () =>
                  {Navigator.pushNamed(context, '')},
                  colorBorder:
                  MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                  MainColorPalettes.colorsThemeMultiple[5]!,
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
        index: 4,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MainColorPalettes.colorsThemeMultiple[5],
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height /10,
              ),
              Text(
                '${MainTextPalettes.textFr["ABOUT"]}',
                style: TextStyle(
                    color: MainColorPalettes.colorsThemeMultiple[10],
                    fontSize: 50,
                    fontFamily: 'DMSans-Bold.ttf'),
              ),
              SizedBox(height: 90,),
              ButtonComponent(
                text: MainTextPalettes.textFr["ABOUTPRENIUM"],
                enumerateCategoriesButton:
                EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                isIOSPlatform: isIOSPlatform,
                methode: () =>
                {Navigator.pushNamed(context, 'confirmEmail')},
                colorBorder:
                MainColorPalettes.colorsThemeMultiple[5]!,
                backgroundColorButton:
                MainColorPalettes.colorsThemeMultiple[5]!,
              ),
              SizedBox(height: 30,),
              ButtonComponent(
                text: MainTextPalettes.textFr["ABOUTNOTIF"],
                enumerateCategoriesButton:
                EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                isIOSPlatform: isIOSPlatform,
                methode: () =>
                {Navigator.pushNamed(context, 'confirmEmail')},
                colorBorder:
                MainColorPalettes.colorsThemeMultiple[5]!,
                backgroundColorButton:
                MainColorPalettes.colorsThemeMultiple[5]!,
              ),
              SizedBox(height: 30,),
              ButtonComponent(
                text: MainTextPalettes.textFr["ABOUT_MY_ACCOUNT"],
                enumerateCategoriesButton:
                EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                isIOSPlatform: isIOSPlatform,
                methode: () =>
                {Navigator.pushNamed(context, 'myAccount')},
                colorBorder:
                MainColorPalettes.colorsThemeMultiple[5]!,
                backgroundColorButton:
                MainColorPalettes.colorsThemeMultiple[5]!,
              ),
              SizedBox(height: 30,),
              ButtonComponent(
                text: MainTextPalettes.textFr["ABOUT_HELP"],
                enumerateCategoriesButton:
                EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                isIOSPlatform: isIOSPlatform,
                methode: () =>
                {Navigator.pushNamed(context, 'confirmEmail')},
                colorBorder:
                MainColorPalettes.colorsThemeMultiple[5]!,
                backgroundColorButton:
                MainColorPalettes.colorsThemeMultiple[5]!,
              ),
              SizedBox(height: 30,),
              ButtonComponent(
                text: MainTextPalettes.textFr["ABOUT_JOYA"],
                enumerateCategoriesButton:
                EnumerateCategoriesButton.typeButtonTextAndIconAndOpacity,
                isIOSPlatform: isIOSPlatform,
                methode: () =>
                {Navigator.pushNamed(context, 'confirmEmail')},
                colorBorder:
                MainColorPalettes.colorsThemeMultiple[5]!,
                backgroundColorButton:
                MainColorPalettes.colorsThemeMultiple[5]!,
              ),
            ],
          )
        ),
      );
    }
  }
}
