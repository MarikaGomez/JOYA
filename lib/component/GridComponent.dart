import 'package:flutter/cupertino.dart';
import 'package:joya/component/ItemsComponent.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainIconsPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';

class GridComponent extends StatelessWidget {

  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  GridComponent({required this.isIOSPlatform,required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data = {
      "content" : {"name": "string",
      "serial_number": "string",
      "location": "string"},
      "conten1t" : {"name": "string",
        "serial_number": "string",
        "location": "string"},
      "onten1t" : {"name": "string",
      "serial_number": "string",
      "location": "string"}
    };
    if(this.isIOSPlatform){
      return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: [
        ],
      );
    }else{
      return GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) =>
            ItemsComponent(
              serial_number: 'test',
              location: 'esss',
              name: "null",
              colorCard: MainColorPalettes.colorsThemeMultiple[5]!,
              colorBorder: MainColorPalettes.colorsThemeMultiple[15]!,
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
      );
    }
  }
}
