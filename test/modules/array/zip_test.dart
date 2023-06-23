import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('even-length', () {
    expect(
        flodash.zip(["a", "b"], [1, 2], [true, false]),
        equals([
          ["a", 1, true],
          ["b", 2, false]
        ]));
  });
  test('uneven-length', () {
    expect(
        flodash.zip(["a", "b"], [], [true, false]),
        equals([
          ["a", null, true],
          ["b", null, false]
        ]));
  });
}
