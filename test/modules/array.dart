import 'package:flodash/flodash.dart' as flodash;
import 'package:flutter_test/flutter_test.dart';

runTests() {
  group('chunk', () {
    List li = ["a", "b", "c", "d"];
    test('even-split', () {
      expect(
          flodash.chunk(li, size: 2),
          equals([["a", "b"], ["c", "d"]])
      );
    });
    test('uneven-split', () {
      expect(
          flodash.chunk(li, size: 3),
          equals([["a", "b", "c"], ["d"]])
      );
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
          flodash.concat(1, [2], [[3], [4]]),
          equals([1, 2, [3], [4]])
      );
    });
    test('nested-lists-2', () {
      expect(
          flodash.concat(1, [2, 4, 5], [[3], [4, 4, 3]]),
          equals([1, 2, 4, 5, [3], [4, 4, 3]])
      );
    });
  });
  group('difference', () {
    test('simple', () {
      expect(
          flodash.difference([2, 1], [2, 3]),
          equals([1])
      );
    });
    test('nested-lists', () {
      expect(
          flodash.difference([2, 1, [2, 3]], [[2, 3]]),
          equals([2,1])
      );
    });
    test('nested-lists-2', () {
      expect(
          flodash.difference([2, 1, [2, 3]], [[2, 3], 2]),
          equals([1])
      );
    });
    test('maps-1', () {
      expect(
          flodash.difference([{"a": 1}, {"b": 2}], [{"a": 1}]),
          equals([{"b": 2}])
      );
    });
    test('maps-2', () {
      expect(
          flodash.difference([{"a": 1}, {"b": 2}], [{"a": 1}, {"b": 2}]),
          equals([])
      );
    });
    test('mixed-types', () {
      expect(
          flodash.difference([2, 1, [2, 3], {"a": 1}, {"b": 2}], [[2, 3], 2, {"a": 1}]),
          equals([1, {"b": 2}])
      );
    });
  });
  group('flatten', () {
    test('simple', () {
      expect(
          flodash.flatten([1, [2, [3, [4]], 5]]),
          equals([1, 2, [3, [4]], 5])
      );
    });
    test('deep', () {
      expect(
          flodash.flattenDeep([1, [2, [3, [4]], 5]]),
          equals([1, 2, 3, 4, 5])
      );
    });
  });
}
