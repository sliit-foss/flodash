import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(
        flodash.dropRightWhile([1, 2, 3, 4], (n) => n > 3), equals([1, 2, 3]));
  });
  test('map-equality', () {
    expect(
        flodash.dropRightWhile([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], {
          "x": 1,
          "y": 2
        }),
        equals([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ]));
  });
  test('truthy property', () {
    expect(
        flodash.dropRightWhile([
          {"x": 0, "y": 6},
          {"x": 5, "y": 1},
          {"x": 4, "y": 7}
        ], "x"),
        equals([
          {"x": 0, "y": 6}
        ]));
  });
}
