import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty', () {
    expect(flodash.isArray([]), equals(true));
  });
  test('list', () {
    expect(flodash.isArray([1, 2, 3]), equals(true));
  });
  test('map', () {
    expect(flodash.isArray({'a': 1}), equals(false));
  });
}
