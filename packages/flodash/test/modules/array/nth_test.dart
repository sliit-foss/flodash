import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.nth([1, 2, 3], n: 1), equals(2));
  });
  test('negative-index', () {
    expect(flodash.nth([1, 2, 3], n: -2), equals(2));
  });
  test('out-of-bounds', () {
    expect(flodash.nth([1, 2, 3], n: 5), equals(null));
  });
}
