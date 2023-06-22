import 'package:flutter_test/flutter_test.dart';
import 'package:enhanced_http/enhanced_http.dart';

void main() {
  group('Fetch API', () {
    EnhancedHttp http = EnhancedHttp(baseURL: "https://dog.ceo/api");
    test('Fetches a random image of a dog from an api', () async {
      dynamic results = await http.get("/breeds/image/random");
      expect(results['status'], 'success');
    });
    test('Fetches a list of dog breeds from an api', () async {
      dynamic results = await http.get("/breeds/list/all");
      expect(results['status'], 'success');
    });
  });
}
