import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('error', () {
    expect(flodash.isError(Error()), equals(true));
  });
  test('exception', () {
    expect(flodash.isError(Exception()), equals(true));
  });
  test('null', () {
    expect(flodash.isError(null), equals(false));
  });
}
