import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.takeRightWhile([1, 2, 3, 4], (n) => n > 2), equals([3, 4]));
  });
  test('map-equality', () {
    expect(
        flodash.takeRightWhile([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], {
          "x": 2,
          "y": 1
        }),
        equals([
          {"x": 2, "y": 1}
        ]));
  });
  test('shorthand-property', () {
    expect(
        flodash.takeRightWhile([
          {"x": 1, "y": 0},
          {"x": 0, "y": 7}
        ], "y"),
        equals([
          {"x": 0, "y": 7}
        ]));
  });
  test('empty', () {
    expect(flodash.takeRightWhile([], (n) => n > 2), equals([]));
  });
}
