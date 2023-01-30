import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('count-by', () {
    expect(flodash.countBy([6.1, 4.2, 6.3], (num) => num.floor()),
        equals({'4': 1, '6': 2}));
  });
  test('reduce', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, accumulator: 0),
        equals(3));
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
  });
}
