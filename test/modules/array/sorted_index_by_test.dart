import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(
        flodash.sortedIndexBy([
          {"x": 4},
          {"x": 5}
        ], {
          "x": 8
        }, (o) => o["x"]),
        equals(2));
  });
  test('shorthand-property', () {
    expect(
        flodash.sortedIndexBy([
          {"x": 4},
          {"x": 5}
        ], {
          "x": 4
        }, "x"),
        equals(0));
  });
}
