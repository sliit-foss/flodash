import 'package:flodash/flodash.dart' as flodash;
import 'package:flutter_test/flutter_test.dart';

runTests() {
  group('chunk', () {
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
  });
  test('compact', () {
    List li = [0, 1, false, 2, '', 3];
    expect(flodash.compact(li), equals([1, 2, 3]));
  });
  group('concat', () {
    test('atomic', () {
      expect(flodash.concat(1, [2, 5], 3, [4]), equals([1, 2, 5, 3, 4]));
    });
    test('nested-lists-1', () {
      expect(
          flodash.concat(1, [
            2
          ], [
            [3],
            [4]
          ]),
          equals([
            1,
            2,
            [3],
            [4]
          ]));
    });
    test('nested-lists-1', () {
      expect(
          flodash.concat(1, [
            2,
            4,
            5
          ], [
            [3],
            [4, 4, 3]
          ]),
          equals([
            1,
            2,
            4,
            5,
            [3],
            [4, 4, 3]
          ]));
    });
  });
}
