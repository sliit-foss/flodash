import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(flodash.xorWith([2.1, 1.2], [2.3, 3.4], (n) => n.floor()),
        equals([1.2, 3.4]));
  });
  test('shorthand-property', () {
    expect(
        flodash.xorWith([
          {"x": 1, "y": 2},
          {"x": 2, "y": 1}
        ], [
          {"x": 1, "y": 2},
          {"x": 3, "y": 4}
        ], "x"),
        equals([
          {"x": 2, "y": 1},
          {"x": 3, "y": 4}
        ]));
  });
}
