import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.takeWhile([1, 2, 3, 4], (n) => n < 3), equals([1, 2]));
  });
  test('map-equality', () {
    expect(
        flodash.takeWhile([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], {
          "x": 1,
          "y": 2
        }),
        equals([
          {"x": 1, "y": 2}
        ]));
  });
  test('shorthand-property', () {
    expect(
        flodash.takeWhile([
          {"x": 1, "y": 6},
          {"x": 0, "y": 0}
        ], "y"),
        equals([
          {"x": 1, "y": 6}
        ]));
  });
  test('empty', () {
    expect(flodash.takeWhile([], (n) => n < 3), equals([]));
  });
}
