import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test("for-each-right", () {
    List items = [];
    flodash
        .forEachRight([1, 2, 3, 4], (value, index) => items.add(value * index));
    expect(items, equals([12, 6, 2, 0]));
  });
}
