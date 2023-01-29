import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('reduce', () {
      expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, accumulator: 0), equals(3));
      expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
    });
}
