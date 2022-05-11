import 'package:flutter/cupertino.dart';
//import 'package:url_launcher/url_launcher.dart';

void navigationPop(BuildContext context) {
  Navigator.pop(context);
}

void navigationPushByName(BuildContext context, String pathName) {
  Navigator.pushNamed(context, pathName);
}

void navigationPushByNameAndRemoveUntil(BuildContext context, String pathName) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil(pathName, (Route<dynamic> route) => false);
}

void redirectToWebPage(String url) async {
  // if (await canLaunch(JOYA_LANDING_PAGE_URL + url)) {
  //   launch(url);
  // }
}
