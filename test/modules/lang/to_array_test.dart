import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('string', () {
    expect(flodash.toArray('a'), equals(['a']));
  });
  test('number', () {
    expect(flodash.toArray(1), equals([]));
  });
  test('double', () {
    expect(flodash.toArray(1.0), equals([]));
  });
  test('bool', () {
    expect(flodash.toArray(true), equals([]));
  });
  test('null', () {
    expect(flodash.toArray(null), equals([]));
  });
  test('nan', () {
    expect(flodash.toArray(double.nan), equals([]));
  });
  test('list', () {
    expect(flodash.toArray([]), equals([]));
    expect(flodash.toArray([1]), equals([1]));
  });
  test('map', () {
    expect(flodash.toArray({}), equals([]));
    expect(flodash.toArray({'a': 1}), equals([1]));
  });
}
