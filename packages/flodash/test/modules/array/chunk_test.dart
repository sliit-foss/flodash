import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  List li = ["a", "b", "c", "d"];
  test('even-split', () {
    expect(
        flodash.chunk(li, size: 2),
        equals([
          ["a", "b"],
          ["c", "d"]
        ]));
  });
  test('uneven-split', () {
    expect(
        flodash.chunk(li, size: 3),
        equals([
          ["a", "b", "c"],
          ["d"]
        ]));
  });
}
