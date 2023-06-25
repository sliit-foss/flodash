import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('iterator function', () {
    expect(flodash.differenceWith([2.1, 1.2], [2.3, 3.4], (n) => n.floor()),
        equals([1.2]));
  });
  test('property', () {
    expect(
        flodash.differenceWith([
          {"x": 2},
          {"x": 1}
        ], [
          {"x": 1}
        ], "x"),
        equals([
          {"x": 2}
        ]));
  });
}
