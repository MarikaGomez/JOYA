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
        itemCount: 100,
        itemBuilder: (context, index) => ItemTile(index),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
        ),
      );
    }
  }
}
