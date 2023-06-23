import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(flodash.dropWhile([1, 2, 3, 4], (n) => n < 3), equals([3, 4]));
  });
  test('map-equality', () {
    expect(
        flodash.dropWhile([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], {
          "x": 1,
          "y": 2
        }),
        equals([
          {"x": 2, "y": 1}
        ]));
  });
  test('truthy property', () {
    expect(
        flodash.dropWhile([
          {"x": 1, "y": 6},
          {"x": 0, "y": 1},
          {"x": 4, "y": 7}
        ], "x"),
        equals([
          {"x": 0, "y": 1},
          {"x": 4, "y": 7}
        ]));
  });
}
