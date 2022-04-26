import 'package:flutter/cupertino.dart';

import '../../../component/TextFieldComponent.dart';
import '../../../styles/MainColorPalettes.dart';
import '../../../styles/MainTextPalettes.dart';

class LoginFormFields extends StatelessWidget {
  Function isValidEmail;
  Function isValidPassword;
  Function setEmail;
  Function setPassword;
  String email;
  String password;

  LoginFormFields({
    required this.isValidEmail,
    required this.isValidPassword,
    required this.setEmail,
    required this.setPassword,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${MainTextPalettes.textFr["CONNEXION_BUTTON_DEFAULT_TEXTFIELD"]}',
          style: TextStyle(
              color: MainColorPalettes.colorsThemeMultiple[10],
              fontSize: 60,
              fontFamily: 'DMSans-Bold.ttf'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height / 25,
            MediaQuery.of(context).size.height / 15,
            MediaQuery.of(context).size.height / 25,
            5,
          ),
          child: TextFieldComponent(
            methode: (data) async {
              setEmail(data);
            },
            text: "${MainTextPalettes.textFr["EMAIL_LABEL_DEFAULT_TEXTFIELD"]}",
            //isValid: snapshot.data["isValidEmail"],
            isNotValidRenderText: "${MainTextPalettes.textFr["ERROR_EMAIL"]}",
            hiddenText: false,
            isValid: isValidEmail(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height / 25,
            MediaQuery.of(context).size.height / 50,
            MediaQuery.of(context).size.height / 25,
            5,
          ),
          child: TextFieldComponent(
            methode: (data) async {
              setPassword(data);
            },
            text:
                "${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}",
            //isValid: snapshot.data["isValidEmail"],
            isNotValidRenderText:
                "${MainTextPalettes.textFr["ERROR_PASSWORD"]}",
            hiddenText: false,
            isValid: isValidPassword(),
          ),
        ),
      ],
    );
  }
}
