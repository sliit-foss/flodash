import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('sum of elements', () {
    expect(flodash.reduceRight([1, 2], (sum, n, i) => sum + n, 0), equals(3));
  });
  test('push to array', () {
    expect(
        flodash.reduceRight([1, 2], (acc, n, i) {
          acc.add(n);
          return acc;
        }, []),
        equals([2, 1]));
  });
}
