import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';

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
      return Container();
    }
  }
}
