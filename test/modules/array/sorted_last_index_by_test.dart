import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(
        flodash.sortedLastIndexBy([
          {"x": 4},
          {"x": 5}
        ], {
          "x": 4
        }, (o) => o["x"]),
        equals(1));
  });
  test('shorthand-property', () {
    expect(
        flodash.sortedLastIndexBy([
          {"x": 4},
          {"x": 4},
          {"x": 5}
        ], {
          "x": 4
        }, "x"),
        equals(2));
  });
}
