import 'package:flutter/material.dart';
import 'package:joya/component/ButtonComponent.dart';
import 'package:joya/pages/login/cubit/login_page.dart';
import 'package:joya/pages/scan/widgets/action_buttons.dart';
import 'package:joya/pages/scan/widgets/add_sensor_form_2_fields.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../data/enum/EnumerateCategoriesButton.dart';
import '../../../styles/MainColorPalettes.dart';
import '../../../styles/MainTextPalettes.dart';

class AddSensorFields extends StatefulWidget {
  Barcode? result;

  AddSensorFields({Key? key, required this.result}) : super(key: key);

  @override
  _AddSensorFieldsState createState() => _AddSensorFieldsState(result);
}

class _AddSensorFieldsState extends State<AddSensorFields> {
  Barcode? result;

  _AddSensorFieldsState(this.result);

  final _networkController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isHidden = true;

  late String network;
  late String networkPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height / 5),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '${MainTextPalettes.textFr["CONFIG_PLANT"]}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSans-Bold.ttf',
                            fontSize: 28,
                            color: MainColorPalettes.colorsThemeMultiple[10],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              network = _networkController.text;
                            });
                          },
                          controller: _networkController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.2),
                              ),
                              hintText:
                                  '${MainTextPalettes.textFr["MY_NETWORK"]}'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              networkPassword = _passwordController.text;
                            });
                          },
                          controller: _passwordController,
                          obscureText: isHidden,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.2),
                              ),
                              suffixIcon: IconButton(
                                icon: isHidden
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: togglePasswordVisibility,
                              ),
                              hintText:
                                  '${MainTextPalettes.textFr["PASSWORD_LABEL_DEFAULT_TEXTFIELD"]}'),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 25),
                      ActionButtonsAddSensor(
                          submit: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddSensorFields2(
                                      result: result,
                                      network: network,
                                      networkPassword: networkPassword
                                  )
                              )
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: Text(result!.code.toString())),
                    ]),
              ))),
    );
  }

  void togglePasswordVisibility() => setState(() {
        isHidden = !isHidden;
      });

  @override
  void dispose() {
    _networkController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
