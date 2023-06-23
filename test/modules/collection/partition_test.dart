import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('list', () {
    expect(
        flodash.partition([1, 2, 3, 4], (value) => value % 2 == 0),
        equals([
          [2, 4],
          [1, 3]
        ]));
  });
  test('string', () {
    expect(
        flodash.partition('abcd', (value) => value == 'b'),
        equals([
          ['b'],
          ['a', 'c', 'd']
        ]));
  });
}
