import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('atomic', () {
    expect(flodash.concat(1, [2, 5], 3, [4]), equals([1, 2, 5, 3, 4]));
  });
  test('nested-lists-1', () {
    expect(
        flodash.concat(1, [
          2
        ], [
          [3],
          [4]
        ]),
        equals([
          1,
          2,
          [3],
          [4]
        ]));
  });
  test('nested-lists-2', () {
    expect(
        flodash.concat(1, [
          2,
          4,
          5
        ], [
          [3],
          [4, 4, 3]
        ]),
        equals([
          1,
          2,
          4,
          5,
          [3],
          [4, 4, 3]
        ]));
  });
}
