import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty', () {
    expect(flodash.isString(''), equals(true));
  });
  test('string', () {
    expect(flodash.isString('a'), equals(true));
  });
  test('number', () {
    expect(flodash.isString(1), equals(false));
  });
  test('list', () {
    expect(flodash.isString([1, 2, 3]), equals(false));
  });
  test('map', () {
    expect(flodash.isString({'a': 1}), equals(false));
  });
}
