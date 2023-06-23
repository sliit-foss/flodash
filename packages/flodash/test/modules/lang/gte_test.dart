import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.gte('a', 'a'), equals(true));
    expect(flodash.gte('a', 'b'), equals(false));
    expect(flodash.gte('b', 'a'), equals(true));
  });
  test('number', () {
    expect(flodash.gte(1, 1), equals(true));
    expect(flodash.gte(1, 2), equals(false));
    expect(flodash.gte(2, 1), equals(true));
  });
  test('double', () {
    expect(flodash.gte(1.0, 1.0), equals(true));
    expect(flodash.gte(1.0, 2.0), equals(false));
    expect(flodash.gte(2.0, 1.0), equals(true));
  });
  test('nan', () {
    expect(flodash.gte(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.gte([], [1]), equals(false));
    expect(flodash.gte([1], []), equals(true));
  });
  test('map', () {
    expect(flodash.gte({}, {'a': 1}), equals(false));
    expect(flodash.gte({'a': 1}, {}), equals(true));
  });
}
