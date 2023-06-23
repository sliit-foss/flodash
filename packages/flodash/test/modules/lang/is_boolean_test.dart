import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('true', () {
    expect(flodash.isBoolean(true), equals(true));
  });
  test('false', () {
    expect(flodash.isBoolean(false), equals(true));
  });
  test('null', () {
    expect(flodash.isBoolean(null), equals(false));
  });
  test('number', () {
    expect(flodash.isBoolean(1), equals(false));
  });
  test('string', () {
    expect(flodash.isBoolean('a'), equals(false));
  });
  test('list', () {
    expect(flodash.isBoolean([1, 2, 3]), equals(false));
  });
  test('map', () {
    expect(flodash.isBoolean({'a': 1}), equals(false));
  });
}
