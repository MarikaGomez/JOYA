import 'package:flutter/cupertino.dart';
import 'package:joya/component/ItemsComponent.dart';
import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';

class GridComponent extends StatelessWidget {
  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  GridComponent(
      {required this.isIOSPlatform, required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "content": {
        "name": "string",
        "serial_number": "string",
        "location": "string"
      },
      "conten1t": {
        "name": "string",
        "serial_number": "string",
        "location": "string"
      },
      "onten1t": {
        "name": "string",
        "serial_number": "string",
        "location": "string"
      }
    };
    if (this.isIOSPlatform) {
      return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        children: [],
      );
    } else {
      return GridView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ItemsComponent(
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
