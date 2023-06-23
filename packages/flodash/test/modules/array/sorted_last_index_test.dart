import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('int', () {
    expect(flodash.sortedLastIndex([4, 5, 5, 5, 6], 5), equals(4));
  });
  test('string', () {
    expect(flodash.sortedLastIndex(["a", "b", "b", "b", "c"], "b"), equals(4));
  });
}
