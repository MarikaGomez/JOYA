import 'package:flutter/cupertino.dart';

void navigationPop(BuildContext context) {
  Navigator.pop(context);
}

void navigationPushByName(BuildContext context, String pathName) {
  Navigator.pushNamed(context, pathName);
}
