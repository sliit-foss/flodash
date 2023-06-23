import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('integer', () {
    expect(flodash.isInteger(1), equals(true));
  });
  test('double-1', () {
    expect(flodash.isInteger(1.3), equals(false));
  });
  test('double-2', () {
    expect(flodash.isInteger(1.0), equals(false));
  });
  test('nan', () {
    expect(flodash.isInteger(double.nan), equals(false));
  });
  test('null', () {
    expect(flodash.isInteger(null), equals(false));
  });
}
