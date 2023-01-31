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
  test('reduce', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, accumulator: 0),
        equals(3));
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
  });
}
