import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.eq('a', 'a'), equals(true));
    expect(flodash.eq('a', 'b'), equals(false));
  });
  test('number', () {
    expect(flodash.eq(1, 1), equals(true));
    expect(flodash.eq(1, 2), equals(false));
  });
  test('double', () {
    expect(flodash.eq(1.0, 1.0), equals(true));
    expect(flodash.eq(1.0, 2.0), equals(false));
  });
  test('bool', () {
    expect(flodash.eq(true, true), equals(true));
    expect(flodash.eq(true, false), equals(false));
  });
  test('null', () {
    expect(flodash.eq(null, null), equals(true));
    expect(flodash.eq(null, 1), equals(false));
  });
  test('nan', () {
    expect(flodash.eq(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.eq([1], [1]), equals(false));
    expect(flodash.eq([1], [2]), equals(false));
  });
  test('map', () {
    expect(flodash.eq({'a': 1}, {'a': 1}), equals(false));
    expect(flodash.eq({'a': 1}, {'a': 2}), equals(false));
  });
}
