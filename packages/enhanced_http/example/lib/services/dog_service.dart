import 'package:enhanced_http_example/services/core/api.dart';

class DogService {
  static Future<dynamic> fetchRandomDogPhoto() async {
    return await apiInstance.get("/breeds/image/random");
  }
}
