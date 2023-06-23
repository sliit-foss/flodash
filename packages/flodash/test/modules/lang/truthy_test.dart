import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.isTruthy(''), equals(false));
    expect(flodash.isTruthy(' '), equals(true));
    expect(flodash.isTruthy('a'), equals(true));
  });
  test('number', () {
    expect(flodash.isTruthy(0), equals(false));
    expect(flodash.isTruthy(1), equals(true));
    expect(flodash.isTruthy(-1), equals(true));
  });
  test('double', () {
    expect(flodash.isTruthy(0.0), equals(false));
    expect(flodash.isTruthy(1.0), equals(true));
    expect(flodash.isTruthy(-1.0), equals(true));
  });
  test('bool', () {
    expect(flodash.isTruthy(false), equals(false));
    expect(flodash.isTruthy(true), equals(true));
  });
  test('null', () {
    expect(flodash.isTruthy(null), equals(false));
  });
  test('nan', () {
    expect(flodash.isTruthy(double.nan), equals(false));
  });
  test('list', () {
    expect(flodash.isTruthy([]), equals(true));
    expect(flodash.isTruthy([1]), equals(true));
  });
  test('map', () {
    expect(flodash.isTruthy({}), equals(true));
    expect(flodash.isTruthy({'a': 1}), equals(true));
  });
}
