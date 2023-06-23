import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.isFalsy(''), equals(true));
    expect(flodash.isFalsy(' '), equals(false));
    expect(flodash.isFalsy('a'), equals(false));
  });
  test('number', () {
    expect(flodash.isFalsy(0), equals(true));
    expect(flodash.isFalsy(1), equals(false));
    expect(flodash.isFalsy(-1), equals(false));
  });
  test('double', () {
    expect(flodash.isFalsy(0.0), equals(true));
    expect(flodash.isFalsy(1.0), equals(false));
    expect(flodash.isFalsy(-1.0), equals(false));
  });
  test('bool', () {
    expect(flodash.isFalsy(false), equals(true));
    expect(flodash.isFalsy(true), equals(false));
  });
  test('null', () {
    expect(flodash.isFalsy(null), equals(true));
  });
  test('nan', () {
    expect(flodash.isFalsy(double.nan), equals(true));
  });
  test('list', () {
    expect(flodash.isFalsy([]), equals(false));
    expect(flodash.isFalsy([1]), equals(false));
  });
  test('map', () {
    expect(flodash.isFalsy({}), equals(false));
    expect(flodash.isFalsy({'a': 1}), equals(false));
  });
}
