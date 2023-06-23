import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('list', () {
    expect(flodash.includes([1, 2, 3], 1), equals(true));
    expect(flodash.includes([1, 2, 3], 1, fromIndex: 2), equals(false));
    expect(flodash.includes([1, 2, 3], 3, fromIndex: -1), equals(true));
    expect(flodash.includes([1, 2, 3], 2, fromIndex: -2), equals(true));
    expect(flodash.includes([1, 2, 3], 1, fromIndex: -4), equals(false));
  });
  test('string', () {
    expect(flodash.includes('abcd', 'bc'), equals(true));
    expect(flodash.includes('abcd', 'bc', fromIndex: 2), equals(false));
    expect(flodash.includes('abcd', 'cd', fromIndex: -1), equals(false));
    expect(flodash.includes('abcd', 'bc', fromIndex: -3), equals(true));
  });
}
