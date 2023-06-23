import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(flodash.findIndex([4, 6, 8, 10], (n) => n > 8), equals(3));
  });
  test('map-equality', () {
    expect(
        flodash.findIndex([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], {
          "x": 1,
          "y": 2
        }),
        equals(0));
  });
  test('truthy property', () {
    expect(
        flodash.findIndex([
          {"x": 1, "y": 6},
          {"x": 0, "y": 1},
          {"x": 4, "y": 7}
        ], "x"),
        equals(0));
  });
}
