library enhanced_http;

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

class EnhancedHttp {
  static late final String? _baseURL;
  static late final Map<String, String>? _headers;
  static late final Function? _errorTransformer;
  static late final String? _defaultErrorMessage;

  static void initialize({required String baseURL, Map<String, String>? headers, Function? errorTransformer, String? defaultErrorMessage}) async {
    _baseURL = baseURL;
    _headers = headers ?? {'Content-Type': "application/json"};
    _errorTransformer = errorTransformer;
    _defaultErrorMessage = defaultErrorMessage;
  }

  static Future<dynamic> get({required String path, required int successStatusCode, dynamic onSuccess}) async {
    try {
      final url = Uri.parse('$_baseURL$path');
      return await apiCall(() async {
        return await http.get(
          url,
          headers: _headers,
        );
      }, successStatusCode, onSuccess);
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> post({required String path, required int successStatusCode, dynamic payload, dynamic onSuccess, bool formData = false, List<dynamic>? files}) async {
    try {
      final url = Uri.parse('$_baseURL$path');
      return await apiCall(() async {
        if (formData) {
          return await multipartRequest('POST', url, payload, files);
        } else {
          return await http.post(
            url,
            headers: _headers,
            body: payload == null ? {} : jsonEncode(payload),
          );
        }
      }, successStatusCode, onSuccess);
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> put({required String path, required int successStatusCode, dynamic payload, dynamic onSuccess, bool formData = false, List<dynamic>? files}) async {
    try {
      final url = Uri.parse('$_baseURL$path');
      return await apiCall(() async {
        if (formData) {
          return await multipartRequest('PUT', url, payload, files);
        } else {
          return await http.put(
            url,
            headers: _headers,
            body: payload == null ? {} : jsonEncode(payload),
          );
        }
      }, successStatusCode, onSuccess);
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> delete({required String path, required int successStatusCode, dynamic onSuccess}) async {
    try {
      final url = Uri.parse('$_baseURL$path');
      return await apiCall(() async {
        return await http.delete(
          url,
          headers: _headers,
        );
      }, successStatusCode, onSuccess);
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> apiCall(Function httpRequest, int successStatusCode, dynamic onSuccess) async {
    try {
      final response = await httpRequest();
      Map<String, dynamic> responseJson = json.decode(response.body);
      if (response.statusCode == successStatusCode) {
        if (onSuccess != null) {
          return onSuccess();
        } else {
          return responseJson;
        }
      } else {
        print(response.statusCode);
        if (_errorTransformer != null) return _errorTransformer!(responseJson);
        return responseJson;
      }
    } catch (e) {
      if (_defaultErrorMessage != null) return _defaultErrorMessage;
      return e;
    }
  }

  static multipartRequest(requestType, url, payload, files) async {
    final request = http.MultipartRequest(requestType, url);
    dynamic headers = _headers;
    headers["Content-Type"] = "multipart/form-data";
    request.headers.addAll(headers);
    request.fields.addAll(Map<String, String>.from(payload));
    if (files != null) {
      for (dynamic file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          file['array_key'],
          file['file'].path,
          contentType: MediaType("image", p.extension(file['file'].path)),
        ));
      }
    }
    dynamic streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
