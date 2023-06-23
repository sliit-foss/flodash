import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('int', () {
    expect(flodash.sortedLastIndexOf([4, 5, 5, 5, 6], 5), equals(3));
  });
  test('string', () {
    expect(
        flodash.sortedLastIndexOf(["a", "b", "b", "b", "c"], "b"), equals(3));
  });
}
