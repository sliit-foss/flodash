import 'package:enhanced_cloud_firestore/enhanced_cloud_firestore.dart';
import 'package:faker/faker.dart';

class UserService {
  static Future<dynamic> fetchUsers() async {
    return await EnhancedFirestore.read(collection: 'users');
  }

  static Future<dynamic> addUser() async {
    return await EnhancedFirestore.write(collection: 'users', payload: {
      'name': faker.person.name(),
      'email': faker.internet.email(),
      'age': faker.randomGenerator.numberOfLength(2)
    });
  }

  static Future<dynamic> deleteUsers() async {
    return await EnhancedFirestore.delete(collection: 'users');
  }
}
