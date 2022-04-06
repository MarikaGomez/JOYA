import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../bloc.dart';

class GetDataInstance extends Bloc {


  Map<String, dynamic> dataInstance = {'key': 2, 'key1': 2};
  var _streamController = StreamController<Map<String, dynamic>>();

  Sink<Map<String, dynamic>> get sink => _streamController.sink;

  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  RequestBloc() {
    sink.add(dataInstance);
  }

  setDataKey(String Key,dynamic NewInstance){
    dataInstance[Key] = NewInstance;
    sink.add(dataInstance);
  }

  @override
  void dispose() => _streamController.close();
}
