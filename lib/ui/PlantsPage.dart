import 'package:flutter/cupertino.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

import '../bloc/PlantsBloc.dart';
import '../bloc/bloc_provider.dart';
import '../data/enum/EnumerateCategoriesButton.dart';
import '../data/enum/EnumerateCategoriesScaffold.dart';

class PlantsPage extends StatefulWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;
  static String pageName = "plants";

  PlantsPage(
      {required this.debugShowCheckedModeBanner, required this.isIOSPlatform});

  @override
  State<PlantsPage> createState() => _PlantsPageState();
}

class _PlantsPageState extends State<PlantsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlantsBloc>(context)?.fetchSensors();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIOSPlatform) {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        index: 1,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: MainColorPalettes.colorsThemeMultiple[5],
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
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
                      methode: (test) => {},
                      text: "${MainTextPalettes.textFr["VIDE"]}",
                      isValid: true,
                      isNotValidRenderText: 'test',
                      hiddenText: true,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
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
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                "\n${MainTextPalettes.textFr["ADDFIRSTPLANT"]}",
                            style: TextStyle(
                                fontFamily: "DMSans-Regular",
                                fontSize: 16,
                                color:
                                    MainColorPalettes.colorsThemeMultiple[20]),
                          ),
                        ]))),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                ButtonComponent(
                  text: MainTextPalettes
                      .textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
                  enumerateCategoriesButton:
                      EnumerateCategoriesButton.typeButtonIconOnly,
                  isIOSPlatform: widget.isIOSPlatform,
                  methode: () async => {
                    await Future.delayed(const Duration(milliseconds: 1000),
                        () {
                      Navigator.pushNamed(context, 'qrcode');
                    })
                  },
                  colorBorder: MainColorPalettes.colorsThemeMultiple[5]!,
                  backgroundColorButton:
                      MainColorPalettes.colorsThemeMultiple[10]!,
                ),
              ],
            )),
      );
    } else {
      return ScaffoldComponent(
        enumerateCategoriesScaffold: EnumerateCategoriesScaffold.curvedBar,
        debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
        index: 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: MainColorPalettes.colorsThemeMultiple[5],
          // child: GridComponent(
          //     isIOSPlatform: widgets.isIOSPlatform,
          //     debugShowCheckedModeBanner: widgets.debugShowCheckedModeBanner)
          // Column(
          //   children: [
          //     SizedBox(
          //       height: MediaQuery.of(context).size.height /50,
          //     ),
          //     Text(
          //       '${MainTextPalettes.textFr["MY_PLANT"]}',
          //       style: TextStyle(
          //           color: MainColorPalettes.colorsThemeMultiple[10],
          //           fontSize: 50,
          //           fontFamily: 'DMSans-Bold.ttf'),
          //     ),
          //     Padding(
          //         padding: EdgeInsets.fromLTRB(
          //           MediaQuery.of(context).size.height / 55,
          //           MediaQuery.of(context).size.height / 35,
          //           MediaQuery.of(context).size.height / 55,
          //           100,
          //         ),
          //         child: TextFieldComponent(
          //           methode: (test)=>{
          //           },
          //           text: "${MainTextPalettes.textFr["VIDE"]}",
          //           isValid: true,
          //           isNotValidRenderText: 'test',
          //           hiddenText: true,
          //         )),
          //     SizedBox(
          //       height: MediaQuery.of(context).size.height /10,
          //     ),
          //     Text(
          //       '${MainTextPalettes.textFr["NOPLANT"]}',
          //       style: TextStyle(
          //           color: MainColorPalettes.colorsThemeMultiple[20],
          //           fontSize: 25,
          //           fontFamily: 'DMSans-Bold.ttf'),
          //     ),
          //     Center(
          //         child: RichText(
          //             textAlign: TextAlign.center,
          //             text: TextSpan(
          //                 children: [
          //                   TextSpan(
          //                     text: "\n${MainTextPalettes.textFr["ADDFIRSTPLANT"]}",
          //                     style: TextStyle(
          //                         fontFamily: "DMSans-Regular",
          //                         fontSize: 16,
          //                         color: MainColorPalettes.colorsThemeMultiple[20]
          //                     ),
          //                   ),
          //                 ]
          //             )
          //         )
          //     ),
          //     GridComponent(isIOSPlatform: isIOSPlatform, debugShowCheckedModeBanner: debugShowCheckedModeBanner),
          //     SizedBox(
          //       height: MediaQuery.of(context).size.height /10,
          //     ),
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(170, 50, 0, 0), // TO DO
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //
          //           ButtonComponent(
          //             text: MainTextPalettes.textFr[
          //             "CONNEXION_BUTTON_DEFAULT_TEXTFIELD"],
          //             enumerateCategoriesButton:
          //             EnumerateCategoriesButton
          //                 .typeButtonIconOnly,
          //             isIOSPlatform: isIOSPlatform,
          //             methode: () async =>
          //             { await Future.delayed(const Duration(milliseconds: 1000), (){
          //               Navigator.pushNamed(context, 'qrcode');
          //             })},
          //             colorBorder:
          //             MainColorPalettes.colorsThemeMultiple[5]!,
          //             backgroundColorButton:
          //             MainColorPalettes.colorsThemeMultiple[10]!,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // )
        ),
      );
    }
  }
}
