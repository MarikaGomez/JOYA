import 'package:flutter/cupertino.dart';
import 'package:joya/component/ScaffoldComponent.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/enum/EnumerateCategoriesButton.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainIconsPalettes.dart';
import 'package:joya/styles/MainTextPalettes.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class GridComponent extends StatelessWidget{

   Widget child;
  bool debugShowCheckedModeBanner;
  bool isIOSPlatform;
  EnumerateCategoriesScaffold enumerateCategoriesScaffold;
  int? index;

   ScaffoldComponent({
     required this.enumerateCategoriesScaffold,
     required this.child,
     required this.isIOSPlatform,
     required this.debugShowCheckedModeBanner,
     this.index
   }) {

   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${MainTextPalettes.textFr["GRIDTITLE"]}',
      home: Scaffold(
        appBar: AppBar(

        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    );
  }




}
