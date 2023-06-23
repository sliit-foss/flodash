import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('int', () {
    expect(flodash.sortedIndexOf([4, 5, 5, 5, 6], 5), equals(1));
  });
  test('string', () {
    expect(flodash.sortedIndexOf(["a", "b", "b", "b", "c"], "d"), equals(5));
  });
}
