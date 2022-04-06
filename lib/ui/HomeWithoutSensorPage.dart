import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:joya/bloc/bloc_provider.dart';
import 'package:joya/bloc/controller/RequestBloc.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:joya/component/TextFieldComponent.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
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
                          padding: EdgeInsets.fromLTRB(10, 150, 0, 50), // TO DO
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
