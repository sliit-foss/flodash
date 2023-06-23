import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('int', () {
    expect(flodash.sortedIndex([30, 50], 40), equals(1));
  });
  test('string', () {
    expect(flodash.sortedIndex(["a", "c"], "a"), equals(0));
  });
}
