import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('multiply elements by 2', () {
    expect(
        flodash.map([1, 2, 3, 4], (value) => value * 2), equals([2, 4, 6, 8]));
  });
}
