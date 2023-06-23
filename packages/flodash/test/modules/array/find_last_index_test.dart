import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(flodash.findLastIndex([9, 6, 8, 10, 12, 45, 32], (n) => n > 8),
        equals(6));
  });
  test('map-equality', () {
    expect(
        flodash.findLastIndex([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1},
          {"x": 1, "y": 2}
        ], {
          "x": 1,
          "y": 2
        }),
        equals(2));
  });
  test('truthy property', () {
    expect(
        flodash.findLastIndex([
          {"x": 1, "y": 6},
          {"x": 0, "y": 1},
          {"x": 4, "y": 7}
        ], "x"),
        equals(2));
  });
}
