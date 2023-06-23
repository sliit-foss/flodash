import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.lt('a', 'a'), equals(false));
    expect(flodash.lt('a', 'b'), equals(true));
    expect(flodash.lt('b', 'a'), equals(false));
  });
  test('number', () {
    expect(flodash.lt(1, 1), equals(false));
    expect(flodash.lt(1, 2), equals(true));
    expect(flodash.lt(2, 1), equals(false));
  });
  test('double', () {
    expect(flodash.lt(1.0, 1.0), equals(false));
    expect(flodash.lt(1.0, 2.0), equals(true));
    expect(flodash.lt(2.0, 1.0), equals(false));
  });
  test('nan', () {
    expect(flodash.lt(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.lt([], [1]), equals(true));
    expect(flodash.lt([1], []), equals(false));
  });
  test('map', () {
    expect(flodash.lt({}, {'a': 1}), equals(true));
    expect(flodash.lt({'a': 1}, {}), equals(false));
  });
}
