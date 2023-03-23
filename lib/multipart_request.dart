import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

class MultipartRequest {
  Future<dynamic> multipartRequest(method, url, payload, headers, files) async {
    final request = http.MultipartRequest(method, url);
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
