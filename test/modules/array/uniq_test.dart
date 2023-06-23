import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('int', () {
    expect(flodash.uniq([2, 1, 2]), equals([2, 1]));
  });
  test('string', () {
    expect(flodash.uniq(["a", "b", "a"]), equals(["a", "b"]));
  });
  test('map', () {
    expect(
        flodash.uniq([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1},
          {"x": 1, "y": 2}
        ]),
        equals([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ]));
  });
  test('list', () {
    expect(
        flodash.uniq([
          [2],
          [1],
          [2]
        ]),
        equals([
          [2],
          [1]
        ]));
  });
}
