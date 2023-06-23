import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.gt('a', 'a'), equals(false));
    expect(flodash.gt('a', 'b'), equals(false));
    expect(flodash.gt('b', 'a'), equals(true));
  });
  test('number', () {
    expect(flodash.gt(1, 1), equals(false));
    expect(flodash.gt(1, 2), equals(false));
    expect(flodash.gt(2, 1), equals(true));
  });
  test('double', () {
    expect(flodash.gt(1.0, 1.0), equals(false));
    expect(flodash.gt(1.0, 2.0), equals(false));
    expect(flodash.gt(2.0, 1.0), equals(true));
  });
  test('nan', () {
    expect(flodash.gt(double.nan, double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.gt([], [1]), equals(false));
    expect(flodash.gt([1], []), equals(true));
  });
  test('map', () {
    expect(flodash.gt({}, {'a': 1}), equals(false));
    expect(flodash.gt({'a': 1}, {}), equals(true));
  });
}
