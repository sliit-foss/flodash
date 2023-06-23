import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test("iterator function", () {
    expect(flodash.filter([1, 2, 3, 4], (value) => value % 2 == 0),
        equals([2, 4]));
  });
  test("truthy property", () {
    expect(
        flodash.filter([
          {'a': 1},
          {'a': 0}
        ], 'a'),
        equals([
          {'a': 1}
        ]));
  });
  test("direct equality", () {
    expect(flodash.filter([1, 2, 3, 4], 1), equals([1]));
    expect(flodash.filter([1, 2, 3, 4], 5), equals([]));
  });
}
