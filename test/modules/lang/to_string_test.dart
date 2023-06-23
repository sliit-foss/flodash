import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.toString('a'), equals('a'));
  });
  test('number', () {
    expect(flodash.toString(1), equals('1'));
  });
  test('double', () {
    expect(flodash.toString(1.0), equals('1.0'));
  });
  test('bool', () {
    expect(flodash.toString(true), equals('true'));
  });
  test('null', () {
    expect(flodash.toString(null), equals(''));
  });
  test('nan', () {
    expect(flodash.toString(double.nan), equals('NaN'));
  });
  test('list', () {
    expect(flodash.toString([]), equals('[]'));
    expect(flodash.toString([1]), equals('[1]'));
  });
  test('map', () {
    expect(flodash.toString({}), equals('{}'));
    expect(flodash.toString({'a': 1}), equals('{a: 1}'));
  });
}
