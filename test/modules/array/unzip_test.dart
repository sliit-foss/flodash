import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(
        flodash.unzip([
          ["a", 1, true],
          ["b", 2, false]
        ]),
        equals([
          ["a", "b"],
          [1, 2],
          [true, false]
        ]));
  });
  test('empty', () {
    expect(
        flodash.unzip([
          ["a", null, true],
          ["b", null, false]
        ]),
        equals([
          ["a", "b"],
          [],
          [true, false]
        ]));
  });
}
