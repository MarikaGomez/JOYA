import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/enum/EnumerateCategoriesScaffold.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainIconsPalettes.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class ScaffoldComponent extends StatelessWidget{

  Widget child;
  bool debugShowCheckedModeBanner;
  bool isIOSPlatform;
  EnumerateCategoriesScaffold enumerateCategoriesScaffold;

  ScaffoldComponent({
    required this.enumerateCategoriesScaffold,
    required this.child,
    required this.isIOSPlatform,
    required this.debugShowCheckedModeBanner,
  });

  @override
  Widget build(BuildContext context) {
    if(enumerateCategoriesScaffold == EnumerateCategoriesScaffold.curvedBar){
      return scaffoldWithCurvedBar();
    }else if (enumerateCategoriesScaffold == EnumerateCategoriesScaffold.noCurvedBar){
      return scaffoldWithNoCurvedBar();
    }else{
      return Container(child: Text('NO'),);
    }
  }

  Widget scaffoldWithCurvedBar() {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: const Key('curved'),
        index: 2,
        height: this.isIOSPlatform ? 70 : 50,
        items: MainIconsPalettes.iconCurved["ICONS_NAV_BAR"], // sinon prend IconConstants.ICONS_CURVED_NAV_BAR,
        color: MainColorPalettes.colorsThemeMultiple[25]!,
        buttonBackgroundColor: MainColorPalettes.colorsThemeMultiple[10]!,
        backgroundColor: MainColorPalettes.colorsThemeMultiple[5]!,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          // if(path[index] == null){
          //   Navigator.pushNamed(context, '/home');
          // }else{
          //   Navigator.pushNamed(context, path[index].toString());
          // }
        },
        letIndexChange: (index) => true,
      ),
    );
  }

  Widget scaffoldWithNoCurvedBar() {
    return Scaffold(
      body: child,
    );
  }
  
}