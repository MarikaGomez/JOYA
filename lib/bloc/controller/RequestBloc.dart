import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../bloc.dart';

class RequestBloc extends Bloc {


  Map<String, dynamic> _response = {'key': 2, 'key1': 2};
  var _streamController = StreamController<Map<String, dynamic>>();

  Sink<Map<String, dynamic>> get sink => _streamController.sink;

  Stream<Map<String, dynamic>> get stream => _streamController.stream;

  RequestBloc() {
    sink.add(_response);
  }

  var url = 'https://reqres.in/';

  get(String path) async {
    final _uri = Uri.parse('$url$path').replace(queryParameters: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    var response = await http.get(_uri);
    try {
      if (response.statusCode == 200) {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      } else {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      }
    } catch (exception) {
      _response['get'] = convert.jsonDecode(response.body);
      sink.add(_response);
    }
  }

  post(String path, Map bodyData) async {
    final _uri = Uri.parse('$url$path').replace(queryParameters: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    String body = json.encode(bodyData);

    var response = await http.post(
        _uri,
        body: body
    );
    try {
      if (response.statusCode == 200) {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      } else {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      }
    } catch (exception) {
      _response['get'] = convert.jsonDecode(response.body);
      sink.add(_response);
    }
  }

  put(String path, Map bodyData) async {
    final _uri = Uri.parse('$url$path').replace(queryParameters: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    String body = json.encode(bodyData);

    var response = await http.put(
        _uri,
        body: body
    );
    try {
      if (response.statusCode == 200) {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      } else {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      }
    } catch (exception) {
      _response['get'] = convert.jsonDecode(response.body);
      sink.add(_response);
    }
  }

  delete(String path, Map bodyData) async {
    final _uri = Uri.parse('$url$path').replace(queryParameters: {
      'Content-Type': 'application/json; charset=UTF-8',
    });
    String body = json.encode(bodyData);

    var response = await http.delete(
        _uri,
        body: body
    );
    try {
      if (response.statusCode == 200) {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      } else {
        _response['get'] = convert.jsonDecode(response.body);
        sink.add(_response);
      }
    } catch (exception) {
      _response['get'] = convert.jsonDecode(response.body);
      sink.add(_response);
    }
  }

  @override
  void dispose() => _streamController.close();
}
