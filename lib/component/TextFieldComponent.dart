import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:joya/styles/MainColorPalettes.dart';
import 'package:joya/styles/MainTextFieldPalettes.dart';

class TextFieldComponent extends StatelessWidget {
  var methode;
  Icon? icon;
  String text;
  bool isValid;
  String isNotValidRenderText;

  TextFieldComponent(
      {required this.methode,
      required this.text,
      required this.isValid,
      this.icon,
      required this.isNotValidRenderText});

  @override
  Widget build(BuildContext context) {
    double margin = (MediaQuery.of(context).size.width / 8);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            // margin: EdgeInsets.all(MediaQuery
            //     .of(context)
            //     .size
            //     .width / 8),
            margin: EdgeInsets.fromLTRB(margin, margin, margin, 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                  MainTextFieldPalettes.simpleTextfield["RADIUS"])),
              color: isValid
                  ? MainColorPalettes.colorsThemeMultiple[5]!
                  : MainColorPalettes.colorsThemeMultiple[30]!.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // shadow direction: bottom right
                )
              ],
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '$text',
                filled: true,
                alignLabelWithHint: true,
                // contentPadding: EdgeInsets.only(bottom: 5.0, left: 10.0, right: 10.0),
                labelStyle: TextStyle(
                  color: isValid
                      ? MainColorPalettes.colorsThemeMultiple[25]!
                      : MainColorPalettes.colorsThemeMultiple[30]!,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'DMSans-Regular',
                  fontSize: MediaQuery.of(context).size.width / 20,
                ),
                fillColor: MainColorPalettes.colorsThemeMultiple[5]!,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(
                      MainTextFieldPalettes.simpleTextfield["RADIUS"])),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        MainTextFieldPalettes.simpleTextfield["RADIUS"])),
                    borderSide: BorderSide(
                        color: isValid
                            ? MainColorPalettes.colorsThemeMultiple[5]!
                            : MainColorPalettes.colorsThemeMultiple[30]!)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        MainTextFieldPalettes.simpleTextfield["RADIUS"])),
                    borderSide: BorderSide(
                        color: isValid
                            ? MainColorPalettes.colorsThemeMultiple[5]!
                            : MainColorPalettes.colorsThemeMultiple[30]!)),
              ),
            )),
        errorInstanceTextWidget()
      ],
    );
  }

  Widget errorInstanceTextWidget() {
    if (isValid) {
      return Text('');
    } else {
      return Text(
        '$isNotValidRenderText',
        style: TextStyle(
          color: MainColorPalettes.colorsThemeMultiple[30]!,
          fontSize: 15,
          fontFamily: 'DMSans-Bold',
        ),
      );
    }
  }
}
