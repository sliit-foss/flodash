import 'package:enhanced_http/enhanced_http.dart';

class DogService {
  static Future<dynamic> fetchRandomDogPhoto() async {
    return await EnhancedHttp.get(path: "/breeds/image/random", successStatusCode: 200);
  }
}
