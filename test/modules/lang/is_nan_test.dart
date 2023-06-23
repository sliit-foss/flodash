import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('nan', () {
    expect(flodash.isNaN(0 / 0), equals(true));
  });
  test('null', () {
    expect(flodash.isNaN(null), equals(false));
  });
  test('number', () {
    expect(flodash.isNaN(1), equals(false));
  });
  test('string', () {
    expect(flodash.isNaN('a'), equals(false));
  });
}
