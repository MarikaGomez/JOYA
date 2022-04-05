import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPLant extends StatelessWidget {

  final bool debugShowCheckedModeBanner;
  final bool isIOSPlatform;

  ListPLant(
      {required this.isIOSPlatform, required this.debugShowCheckedModeBanner});

  @override
  Widget build(BuildContext context) {
    if (this.isIOSPlatform) {
      return Scaffold(
        appBar: AppBar(

        ),

        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return InkWell(
child : Center(

  child: Text(
    'Item $index',
    style: Theme
        .of(context)
        .textTheme
        .headline5,

  ),
)
            );

          }),
        ),
      );

  }

  }
}