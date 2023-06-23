import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.isEqual('a', 'a'), equals(true));
    expect(flodash.isEqual('a', 'b'), equals(false));
  });
  test('number', () {
    expect(flodash.isEqual(1, 1), equals(true));
    expect(flodash.isEqual(1, 2), equals(false));
  });
  test('double', () {
    expect(flodash.isEqual(1.0, 1.0), equals(true));
    expect(flodash.isEqual(1.0, 2.0), equals(false));
  });
  test('bool', () {
    expect(flodash.isEqual(true, true), equals(true));
    expect(flodash.isEqual(true, false), equals(false));
  });
  test('null', () {
    expect(flodash.isEqual(null, null), equals(true));
    expect(flodash.isEqual(null, 1), equals(false));
  });
  test('nan', () {
    expect(flodash.isEqual(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.isEqual([], []), equals(true));
    expect(flodash.isEqual([1], [1]), equals(true));
    expect(flodash.isEqual([1], [2]), equals(false));
  });
  test('map', () {
    expect(flodash.isEqual({}, {}), equals(true));
    expect(flodash.isEqual({'a': 1}, {'a': 1}), equals(true));
    expect(flodash.isEqual({'a': 1}, {'a': 2}), equals(false));
  });
}
