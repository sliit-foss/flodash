import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('type equality', () {
    List<dynamic> li1 = [1, 2, 3], li2 = [1, 2, 3];
    expect(flodash.every([true, 1, null, 'yes'], String), equals(false));
    expect(flodash.every([true, false, true, true], bool), equals(true));
    expect(flodash.every([4, 1, 2, 4], int), equals(true));
    expect(flodash.every([3.0, 4.6, 6.7], double), equals(true));
    expect(flodash.every([li1, li2], List), equals(true));
    expect(
        flodash.every([
          [5],
          6
        ], Map),
        equals(false));
    expect(flodash.every([true, 1, null, 'yes'], Set), equals(false));
  });
  test('iterator function', () {
    expect(
        flodash.every([1, 3, 5, 7], (value) => value % 2 == 1), equals(true));
  });
  test('truthy property', () {
    expect(
        flodash.every([
          {'a': 1},
          {'a': 2}
        ], 'a'),
        equals(true));
    expect(
        flodash.every([
          {'a': 1},
          {'a': 0}
        ], 'a'),
        equals(false));
  });
  test('direct equality', () {
    expect(flodash.every([1, 3, 5, 7], 1), equals(false));
    expect(flodash.every([3, 3, 3, 3], 3), equals(true));
  });
}
