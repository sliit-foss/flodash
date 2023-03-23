library enhanced_http;

import 'dart:convert';
import 'package:enhanced_http/multipart_request.dart';
import 'package:enhanced_http/interceptor.dart';
import 'package:enhanced_http/utils.dart';
import 'package:http/http.dart' as http;

class EnhancedHttp extends MultipartRequest with Interceptor, Utils {
  late final String? baseURL;
  late final Map<String, String>? headers;

  EnhancedHttp(
      {String this.baseURL = "",
      Map<String, String>? headers,
      Map<String, Function>? interceptors}) {
    this.headers = headers ?? {'Content-Type': "application/json"};
    this.interceptors = interceptors;
  }

  Future<dynamic> get(String path,
      {Map<String, String>? headers,
      Map<String, Function>? interceptors}) async {
    return await request(() async {
      return await http.get(
        Uri.parse('$baseURL$path'),
        headers: mergeHeaders(this.headers, headers),
      );
    }, interceptors);
  }

  Future<dynamic> post(String path,
      {dynamic payload,
      Map<String, String>? headers,
      Map<String, Function>? interceptors,
      List<dynamic>? files}) async {
    final url = Uri.parse('$baseURL$path');
    return await request(() async {
      if (isFormData(headers)) {
        return await multipartRequest(
            'POST', url, payload, mergeHeaders(this.headers, headers), files);
      } else {
        return await http.post(
          url,
          headers: mergeHeaders(this.headers, headers),
          body: payload == null ? {} : jsonEncode(payload),
        );
      }
    }, interceptors);
  }

  Future<dynamic> _update(
      String method, String path, payload, headers, interceptors, files) async {
    final url = Uri.parse('$baseURL$path');
    return await request(() async {
      if (isFormData(headers)) {
        return await multipartRequest(
            method, url, payload, mergeHeaders(this.headers, headers), files);
      } else {
        payload ??= {};
        if (method == "PUT") {
          return await http.put(
            url,
            headers: mergeHeaders(this.headers, headers),
            body: jsonEncode(payload),
          );
        }
        return await http.patch(
          url,
          headers: mergeHeaders(this.headers, headers),
          body: jsonEncode(payload),
        );
      }
    }, interceptors);
  }

  Future<dynamic> put(String path,
      {dynamic payload,
      Map<String, String>? headers,
      Map<String, Function>? interceptors,
      List<dynamic>? files}) async {
    return _update("PUT", path, payload, headers, interceptors, files);
  }

  Future<dynamic> patch(String path,
      {dynamic payload,
      Map<String, String>? headers,
      Map<String, Function>? interceptors,
      List<dynamic>? files}) async {
    return _update("PATCH", path, payload, headers, interceptors, files);
  }

  Future<dynamic> delete(String path,
      {Map<String, String>? headers,
      Map<String, Function>? interceptors}) async {
    return await request(() async {
      return await http.delete(
        Uri.parse('$baseURL$path'),
        headers: mergeHeaders(this.headers, headers),
      );
    }, interceptors);
  }

  Future<dynamic> head(String path,
      {Map<String, String>? headers,
      Map<String, Function>? interceptors}) async {
    return await request(() async {
      return await http.head(
        Uri.parse('$baseURL$path'),
        headers: mergeHeaders(this.headers, headers),
      );
    }, interceptors);
  }
}
