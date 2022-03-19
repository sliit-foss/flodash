import 'package:flutter_test/flutter_test.dart';
import 'package:enhanced_cloud_firestore/enhanced_cloud_firestore.dart';

void main() {
  test('fetches a list of active users from a users collection', () async {
    List<dynamic> filters = [{'name': 'is_active', 'value': true}];
    List<dynamic> sorts = [{'name': 'username', 'descending': false}];
    final responseDocs = await EnhancedFirestore.read(collection: 'users', filters :filters, sorts: sorts);
    print(responseDocs);
  });
}
