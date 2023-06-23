import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test("iterator function", () {
    expect(
        flodash.findLast([1, 2, 3, 4], (value) => value % 2 == 0), equals(4));
  });
  test("truthy property", () {
    expect(
        flodash.findLast([
          {'a': 1},
          {'a': 0}
        ], 'a'),
        equals({'a': 1}));
  });
  test("direct equality", () {
    expect(flodash.findLast([1, 2, 3, 4], 3), equals(3));
    expect(flodash.findLast([1, 2, 3, 4], 5), equals(null));
  });
}
