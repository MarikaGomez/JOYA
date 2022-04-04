import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/styles/WidgetStylePalettes.dart';

class ContainerCustum extends StatelessWidget {

  final Widget child;
  final bool debugShowCheckedModeBanner;
  ContainerCustum({required this.child,required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: debugShowCheckedModeBanner ?
        WidgetStylePalettes.DEBUG_COLOR :
        WidgetStylePalettes.DEBUG_COLOR_CONTAINER_CUSTUM,
        padding: WidgetStylePalettes.PADDING_CONTAINER_CUSTUM,
        child: Container(
            width: MediaQuery.of(context).size.width / 1.5 ,
            height: MediaQuery.of(context).size.height / 1.5 ,
            color: debugShowCheckedModeBanner ?
            WidgetStylePalettes.DEBUG_COLOR_DEEP :
            WidgetStylePalettes.DEBUG_COLOR_DEEP_CONTAINER_CUSTUM,
            child: Padding(
              padding: WidgetStylePalettes.PADDING_CONTAINER_CUSTUM_DEEP,
              child: child,
            )
        )
    );
  }
}
