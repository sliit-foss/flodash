import 'package:flutter_test/flutter_test.dart';

import 'package:flodash/flodash.dart' as flodash;

runTests() {
  group('Chunk', () {
    List li = ["a", "b", "c", "d"];
    test('Even Split', () {
      expect(
          flodash.chunk(li, size: 2),
          equals([
            ["a", "b"],
            ["c", "d"]
          ]));
    });

    test('Uneven Split', () {
      expect(
          flodash.chunk(li, size: 3),
          equals([
            ["a", "b", "c"],
            ["d"]
          ]));
    });
  });

  test('Compact', () {
    List li = [0, 1, false, 2, '', 3];
    expect(flodash.compact(li), equals([1, 2, 3]));
  });
}
