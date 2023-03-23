import 'dart:convert';
import 'package:enhanced_http/http_error.dart';

class Interceptor {
  Map<String, Function>? interceptors = {};

  String? defaultErrorMessage;

  Future<dynamic> request(
      Function request, Map<String, Function>? _interceptors) async {
    _interceptors = {...?interceptors, ...(_interceptors ?? {})};
    try {
      final response = await request();
      dynamic data;
      try {
        data = json.decode(response.body);
      } catch (e) {
        data = response.body;
      }
      final decoded = {
        "status": response.statusCode,
        "data": data,
        "headers": response.headers
      };
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        if (_interceptors["response"] != null)
          return _interceptors["response"]!(decoded);
        return data;
      } else {
        if (_interceptors["error"] != null)
          return _interceptors["error"]!(decoded);
        throw HttpError(response.statusCode, response.headers, data);
      }
    } on Error catch (e) {
      if (_interceptors["error"] != null) return _interceptors["error"]!(e);
      rethrow;
    }
  }
}
