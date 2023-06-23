import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('sum of elements with an accumulator defined', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, 0), equals(3));
  });
  test('sum of elements without an accumulator', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
  });
}
