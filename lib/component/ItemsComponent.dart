import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/component/BoxShadowComponent.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainWidgetPalettes.dart';

class ItemsComponent extends StatelessWidget {
  final String name;
  final String serial_number;
  final String location;
  final Color colorBorder;
  final Color colorCard;

  // "content" : {"name": "string",
  // "serial_number": "string",
  // "location": "string"}

  const ItemsComponent(
      {required this.name,
      required this.serial_number,
      required this.location,
      required this.colorBorder,
      required this.colorCard});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
          10,
          20,
          10,
          0,
        ),
        child: GestureDetector(
            onTap: () {
              print("Container clicked");
            },
            child: Container(
              decoration: BoxDecoration(
                color: colorCard,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MainWidgetPalettes.itemsComponentConfig["ROUND"]),
                    topRight: Radius.circular(
                        MainWidgetPalettes.itemsComponentConfig["ROUND"]),
                    bottomLeft: Radius.circular(
                        MainWidgetPalettes.itemsComponentConfig["ROUND"]),
                    bottomRight: Radius.circular(
                        MainWidgetPalettes.itemsComponentConfig["ROUND"])),
                boxShadow: [
                  BoxShadow(
                    color: colorBorder,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [Text("test")],
              ),
            )
        )
    );
  }
}
