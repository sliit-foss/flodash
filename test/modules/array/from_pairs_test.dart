import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('atomic', () {
    expect(
        flodash.fromPairs([
          ["a", 1],
          ["b", 2]
        ]),
        equals({"a": 1, "b": 2}));
  });
  test('nested-maps', () {
    expect(
        flodash.fromPairs([
          [
            "a",
            {"c": "d"}
          ],
          [
            "b",
            {"e": "f"}
          ]
        ]),
        equals({
          "a": {"c": "d"},
          "b": {"e": "f"}
        }));
  });
}
