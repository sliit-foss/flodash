import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.intersectionWith([2.1, 1.2], [2.3, 3.4], (n) => n.floor()),
        equals([2.1]));
  });
  test('multiple', () {
    expect(
        flodash.intersectionWith(
            [2.1, 1.2], [2.3, 3.4], [4.5, 5.6, 2.4], [2.25], (n) => n.floor()),
        equals([2.1]));
  });
  test('no-intersections', () {
    expect(
        flodash.intersectionWith(
            [2.1, 1.2], [6.3, 3.4], [2.5, 0.6], (n) => n.floor()),
        equals([]));
  });
  test('property-equality', () {
    expect(
        flodash.intersectionWith([
          {"x": 1},
          {"x": 2}
        ], [
          {"x": 2},
          {"x": 1}
        ], "x"),
        equals([
          {"x": 1},
          {"x": 2}
        ]));
  });
}
