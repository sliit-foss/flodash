import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

class StreamedRequest {
  Future<dynamic> streamedRequest(method, url, headers, {payload, files, responseType}) async {
    final request = http.MultipartRequest(method, url);
    request.headers.addAll(headers);
    if (payload != null) {
      request.fields.addAll(Map<String, String>.from(payload));
    }
    if (files != null) {
      for (dynamic file in files) {
        request.files.add(await http.MultipartFile.fromPath(
          file['array_key'],
          file['file'].path,
          contentType: MediaType("image", p.extension(file['file'].path)),
        ));
      }
    }
    http.StreamedResponse streamedResponse = await request.send();
    if (responseType == "stream") {
      return streamedResponse;
    }
    return await http.Response.fromStream(streamedResponse);
  }
}
