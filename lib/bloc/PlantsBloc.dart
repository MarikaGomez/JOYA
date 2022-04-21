import 'dart:async';
import 'package:flutter/cupertino.dart';

import 'bloc.dart';

class LoginBloc extends Bloc {
  BuildContext context;
  LoginBloc({required this.context}) {
    sink.add(_dataInstance);
  }

  Map<String, dynamic> _dataInstance = {
    "isValidEmail": true,
    "email": "",
    "password": ""
  };
  var _streamController = StreamController<Map<String, dynamic>>();

  Sink<Map<String, dynamic>> get sink => _streamController.sink;

  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  setByKey(String key, String value) {
    _dataInstance[key] = value;
    sink.add(_dataInstance);
  }

  fetchSensors() async {
    try {} catch (error) {}
  }

  @override
  void dispose() => _streamController.close();
}
