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
  group('difference-with', () {
    test('iterator-function', () {
      expect(
          flodash.differenceWith([2.1, 1.2], [2.3, 3.4], (n) => n.floor()),
          equals([1.2])
      );
    });
    test('property', () {
      expect(
          flodash.differenceWith([{"x": 2}, {"x": 1}], [{"x": 1}], "x"),
          equals([{"x": 2}])
      );
    });
  });
  group('drop', () {
    test('default', () {
      expect(
          flodash.drop([1, 2, 3]),
          equals([2, 3])
      );
    });
    test('custom-length', () {
      expect(
          flodash.drop([1, 2, 3], n: 2),
          equals([3])
      );
    });
  });
  group('drop-right', () {
    test('default', () {
      expect(
          flodash.dropRight([1, 2, 3]),
          equals([1, 2])
      );
    });
    test('custom-length', () {
      expect(
          flodash.dropRight([1, 2, 3], n: 2),
          equals([1])
      );
    });
  });
  group('drop-right-while', () {
    test('iterator-function', () {
      expect(
          flodash.dropRightWhile([1, 2, 3, 4], (n) => n > 3),
          equals([1, 2, 3])
      );
    });
    test('map-equality', () {
      expect(
          flodash.dropRightWhile([{"x": 1, "y": 2}, {"x": 2, "y": 1}], {"x": 1, "y": 2}),
          equals([{"x": 1, "y": 2}, {"x": 2, "y": 1}])
      );
    });
    test('truthy-property', () {
      expect(
          flodash.dropRightWhile([{"x": 0, "y": 6}, {"x": 5, "y": 1}, {"x": 4, "y": 7}], "x"),
          equals([{"x": 0, "y": 6}])
      );
    });
  });
  group('drop-while', () {
    test('iterator-function', () {
      expect(
          flodash.dropWhile([1, 2, 3, 4], (n) => n < 3),
          equals([3, 4])
      );
    });
    test('map-equality', () {
      expect(
          flodash.dropWhile([{"x": 1, "y": 2}, {"x": 2, "y": 1}], {"x": 1, "y": 2}),
          equals([{"x": 2, "y": 1}])
      );
    });
    test('truthy-property', () {
      expect(
          flodash.dropWhile([{"x": 1, "y": 6}, {"x": 0, "y": 1}, {"x": 4, "y": 7}], "x"),
          equals([{"x": 0, "y": 1}, {"x": 4, "y": 7}])
      );
    });
  });
  group('fill', () {
    test('default', () {
      expect(
          flodash.fill([4, 6, 8, 10], "*"),
          equals(["*", "*", "*", "*"])
      );
    });
    test('start-end', () {
      expect(
          flodash.fill([4, 6, 8, 10], "*", start: 1, end: 3),
          equals([4, "*", "*", 10])
      );
    });
  });
  group('find-index', () {
    test('iterator-function', () {
      expect(
          flodash.findIndex([4, 6, 8, 10], (n) => n > 8),
          equals(3)
      );
    });
    test('map-equality', () {
      expect(
          flodash.findIndex([{"x": 1, "y": 2}, {"x": 2, "y": 1}], {"x": 1, "y": 2}),
          equals(0)
      );
    });
    test('truthy-property', () {
      expect(
          flodash.findIndex([{"x": 1, "y": 6}, {"x": 0, "y": 1}, {"x": 4, "y": 7}], "x"),
          equals(0)
      );
    });
  });
  group('find-last-index', () {
    test('iterator-function', () {
      expect(
          flodash.findLastIndex([9, 6, 8, 10, 12, 45, 32], (n) => n > 8),
          equals(6)
      );
    });
    test('map-equality', () {
      expect(
          flodash.findLastIndex([{"x": 1, "y": 2}, {"x": 2, "y": 1}, {"x": 1, "y": 2}], {"x": 1, "y": 2}),
          equals(2)
      );
    });
    test('truthy-property', () {
      expect(
          flodash.findLastIndex([{"x": 1, "y": 6}, {"x": 0, "y": 1}, {"x": 4, "y": 7}], "x"),
          equals(2)
      );
    });
  });
  test('first', () {
    expect(
        flodash.first([1, 2, 3]),
        equals(1)
    );
  });
  test('head', () {
    expect(
        flodash.head([2, 3]),
        equals(2)
    );
  });
  group('flatten', () {
    test('atomic', () {
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
    test('depth', () {
      expect(
          flodash.flattenDepth([1, [2, [3, [4]], 5]], depth: 2),
          equals([1, 2, 3, [4], 5])
      );
    });
  });
}
