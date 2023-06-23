import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iteratee', () {
    expect(flodash.unionWith([2.1], [1.2, 2.3], (n) => n.floor()),
        equals([2.1, 1.2]));
  });
  test('shorthand-property', () {
    expect(
        flodash.unionWith([
          {"x": 1}
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
