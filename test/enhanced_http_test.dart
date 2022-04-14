import 'package:flutter_test/flutter_test.dart';
import 'package:enhanced_http/enhanced_http.dart';

void main() {
  group('Fetch API', ()
  {
    EnhancedHttp.initialize(baseURL: "https://dog.ceo/api");
    test('Fetches a random image of a dog from an api', () async {
      dynamic results = await EnhancedHttp.get(path: "/breeds/image/random", successStatusCode: 200);
      expect(results['status'], 'success');
    });
    test('Fetches a list of dog breeds from an api', () async {
      dynamic results = await EnhancedHttp.get(path: "/breeds/list/all", successStatusCode: 200);
      expect(results['status'], 'success');
    });
  });
}
