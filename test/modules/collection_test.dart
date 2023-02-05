import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('count-by', () {
    expect(flodash.countBy([6.1, 4.2, 6.3], (num) => num.floor()),
        equals({'4': 1, '6': 2}));
  });
  group('each', () {
    test('list', () {
      List items = [];
      flodash.each([1, 2], (n, i) => items.add(n * 2));
      expect(items, equals([2, 4]));
    });
    test('set', () {
      List items = [];
      flodash.each({1, 2}, (n, i) => items.add(n * 2));
      expect(items, equals([2, 4]));
    });
    test('map', () {
      List items = [];
      flodash
          .each({'a': 1, 'b': 2}, (value, key) => items.addAll([key, value]));
      expect(items, equals(['a', 1, 'b', 2]));
    });
  });
  group('each-right', () {
    test('list', () {
      List items = [];
      flodash.eachRight([1, 2], (n, i) => items.add(n * 2));
      expect(items, equals([4, 2]));
    });
    test('set', () {
      List items = [];
      flodash.eachRight({1, 2}, (n, i) => items.add(n * 2));
      expect(items, equals([4, 2]));
    });
    test('map', () {
      List items = [];
      flodash.eachRight(
          {'a': 1, 'b': 2}, (value, key) => items.addAll([key, value]));
      expect(items, equals(['b', 2, 'a', 1]));
    });
  });
  group('every', () {
    test('type-equality', () {
      List<dynamic> li1 = [1, 2, 3], li2 = [1, 2, 3];
      expect(flodash.every([true, 1, null, 'yes'], String), equals(false));
      expect(flodash.every([true, false, true, true], bool), equals(true));
      expect(flodash.every([4, 1, 2, 4], int), equals(true));
      expect(flodash.every([3.0, 4.6, 6.7], double), equals(true));
      expect(flodash.every([li1, li2], List), equals(true));
      expect(
          flodash.every([
            [5],
            6
          ], Map),
          equals(false));
      expect(flodash.every([true, 1, null, 'yes'], Set), equals(false));
    });
    test('iterator-function', () {
      expect(
          flodash.every([1, 3, 5, 7], (value) => value % 2 == 1), equals(true));
    });
    test('truthy-property', () {
      expect(
          flodash.every([
            {'a': 1},
            {'a': 2}
          ], 'a'),
          equals(true));
      expect(
          flodash.every([
            {'a': 1},
            {'a': 0}
          ], 'a'),
          equals(false));
    });
    test('direct-equality', () {
      expect(flodash.every([1, 3, 5, 7], 1), equals(false));
      expect(flodash.every([3, 3, 3, 3], 3), equals(true));
    });
  });
  group("filter", () {
    test("iterator-function", () {
      expect(flodash.filter([1, 2, 3, 4], (value) => value % 2 == 0),
          equals([2, 4]));
    });
    test("truthy-property", () {
      expect(
          flodash.filter([
            {'a': 1},
            {'a': 0}
          ], 'a'),
          equals([{'a': 1}]));
    });
    test("direct-equality", () {
      expect(flodash.filter([1, 2, 3, 4], 1), equals([1]));
      expect(flodash.filter([1, 2, 3, 4], 5), equals([]));
    });
  });
  group("find", () {
    test("iterator-function", () {
      expect(flodash.find([1, 2, 3, 4], (value) => value % 2 == 0), equals(2));
    });
    test("truthy-property", () {
      expect(
          flodash.find([
            {'a': 1},
            {'a': 0}
          ], 'a'),
          equals({'a': 1}));
    });
    test("direct-equality", () {
      expect(flodash.find([1, 2, 3, 4], 1), equals(1));
      expect(flodash.find([1, 2, 3, 4], 5), equals(null));
    });
  });
  group("find-last", () {
    test("iterator-function", () {
      expect(flodash.findLast([1, 2, 3, 4], (value) => value % 2 == 0),
          equals(4));
    });
    test("truthy-property", () {
      expect(
          flodash.findLast([
            {'a': 1},
            {'a': 0}
          ], 'a'),
          equals({'a': 1}));
    });
    test("direct-equality", () {
      expect(flodash.findLast([1, 2, 3, 4], 3), equals(3));
      expect(flodash.findLast([1, 2, 3, 4], 5), equals(null));
    });
  });
  group("flat-map", () {
    test("iterator-function", () {
      expect(flodash.flatMap([1, 2, 3, 4], (value) => [value, value]),
          equals([1, 1, 2, 2, 3, 3, 4, 4]));
    });
  });
  group("flat-map-deep", () {
    test("iterator-function", () {
      expect(flodash.flatMapDeep([1, 2, 3, 4], (value) => [[value, value * 2], [value, value / 2]]),
          equals([1, 2, 1, 0.5, 2, 4, 2, 1, 3, 6, 3, 1.5, 4, 8, 4, 2]));
    });
  });
  group("flat-map-depth", () {
    test("depth-1", () {
      expect(
          flodash.flatMapDepth([1, 2, 3, 4], (value) => [[value, value * 2], [value, value / 2]], depth: 1),
          equals([[1, 2], [1, 0.5], [2, 4], [2, 1.0], [3, 6], [3, 1.5], [4, 8], [4, 2.0]]));
    });
    test("depth-2", () {
      expect(
          flodash.flatMapDepth([1, 2, 3, 4], (value) => [[value, value * 2], [value, value / 2]], depth: 2),
          equals([1, 2, 1, 0.5, 2, 4, 2, 1, 3, 6, 3, 1.5, 4, 8, 4, 2]));
    });
  });
  test("for-each", () {
    List items = [];
    flodash.forEach([1, 2, 3, 4], (value, index) => items.add(value * index));
    expect(items, equals([0, 2, 6, 12]));
  });
  test("for-each-right", () {
    List items = [];
    flodash.forEachRight([1, 2, 3, 4], (value, index) => items.add(value * index));
    expect(items, equals([12, 6, 2, 0]));
  });
  group('group-by', () {
    test('iterator-function', () {
      expect(
          flodash.groupBy([6.1, 4.2, 6.3], (value) => value.floor()),
          equals({
            4: [4.2],
            6: [6.1, 6.3]
          }));
    });
    test('shorthand-property', () {
      expect(
          flodash.groupBy([
            {'a': 1},
            {'a': 2},
            {'a': 1}
          ], 'a'),
          equals({
            1: [
              {'a': 1},
              {'a': 1}
            ],
            2: [
              {'a': 2}
            ]
          }));
    });
  });
  group('includes', () {
    test('list', () {
      expect(flodash.includes([1, 2, 3], 1), equals(true));
      expect(flodash.includes([1, 2, 3], 1, fromIndex: 2), equals(false));
      expect(flodash.includes([1, 2, 3], 3, fromIndex: -1), equals(true));
      expect(flodash.includes([1, 2, 3], 2, fromIndex: -2), equals(true));
      expect(flodash.includes([1, 2, 3], 1, fromIndex: -4), equals(false));
    });
    test('string', () {
      expect(flodash.includes('abcd', 'bc'), equals(true));
      expect(flodash.includes('abcd', 'bc', fromIndex: 2), equals(false));
      expect(flodash.includes('abcd', 'cd', fromIndex: -1), equals(false));
      expect(flodash.includes('abcd', 'bc', fromIndex: -3), equals(true));
    });
  });
  test('reduce', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, accumulator: 0),
        equals(3));
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
  });
}
