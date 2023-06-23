import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.lte('a', 'a'), equals(true));
    expect(flodash.lte('a', 'b'), equals(true));
    expect(flodash.lte('b', 'a'), equals(false));
  });
  test('number', () {
    expect(flodash.lte(1, 1), equals(true));
    expect(flodash.lte(1, 2), equals(true));
    expect(flodash.lte(2, 1), equals(false));
  });
  test('double', () {
    expect(flodash.lte(1.0, 1.0), equals(true));
    expect(flodash.lte(1.0, 2.0), equals(true));
    expect(flodash.lte(2.0, 1.0), equals(false));
  });
  test('nan', () {
    expect(flodash.lte(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.lte([], [1]), equals(true));
    expect(flodash.lte([1], []), equals(false));
  });
  test('map', () {
    expect(flodash.lte({}, {'a': 1}), equals(true));
    expect(flodash.lte({'a': 1}, {}), equals(false));
  });
}
