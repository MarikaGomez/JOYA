import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:joya/data/repositories/joya/auth.dart';
import 'package:joya/data/services/api/joya/auth.dart';


import 'bloc.dart';

class LoginBloc extends Bloc {
  AuthRepository _authRepository = AuthRepository(authService: AuthService());

  Map<String, dynamic> _dataInstance = {
    "isValidEmail": true,
    "email": "",
    "password": ""
  };
  var _streamController = StreamController<Map<String, dynamic>>();

  Sink<Map<String, dynamic>> get sink => _streamController.sink;

  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  LoginBloc() {
    sink.add(_dataInstance);
  }

  setByKey(String key, String value) {
    _dataInstance[key] = value;
    sink.add(_dataInstance);
  }
  setIsValidEmail(bool newInstance){
    _dataInstance["isValidEmail"] = newInstance;
    sink.add(_dataInstance);
  }

  login() async {
    print("salut fdp je te baise ta mere");
    print(_dataInstance["email"]);
    print(_dataInstance["password"]);
    try {
      _authRepository.login(
          email: _dataInstance["email"], password: _dataInstance["password"]);
    } catch (error) {
      // todo show sidebar

    }
  }

  @override
  void dispose() => _streamController.close();
}
