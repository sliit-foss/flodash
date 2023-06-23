import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test("for-each", () {
    List items = [];
    flodash.forEach([1, 2, 3, 4], (value, index) => items.add(value * index));
    expect(items, equals([0, 2, 6, 12]));
  });
}
