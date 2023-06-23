import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(
        flodash.uniqBy([2.1, 1.2, 2.3], (o) => o.floor()), equals([2.1, 1.2]));
  });
  test('shorthand-property', () {
    expect(
        flodash.uniqBy([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1},
          {"x": 1, "y": 2}
        ], "x"),
        equals([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ]));
  });
}
