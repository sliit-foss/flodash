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
      flodash.each([1, 2], (n, i) => items.add(n*2));
      expect(items, equals([2, 4]));
    });
    test('set', () {
      List items = [];
      flodash.each({1, 2}, (n, i) => items.add(n*2));
      expect(items, equals([2, 4]));
    });
    test('map', () {
      List items = [];
      flodash.each({'a': 1, 'b': 2}, (value, key) => items.addAll([key, value]));
      expect(items, equals(['a', 1, 'b', 2]));
    });
  });
  group('each-right', () {
    test('list', () {
      List items = [];
      flodash.eachRight([1, 2], (n, i) => items.add(n*2));
      expect(items, equals([4, 2]));
    });
    test('set', () {
      List items = [];
      flodash.eachRight({1, 2}, (n, i) => items.add(n*2));
      expect(items, equals([4, 2]));
    });
    test('map', () {
      List items = [];
      flodash.eachRight({'a': 1, 'b': 2}, (value, key) => items.addAll([key, value]));
      expect(items, equals(['b', 2, 'a', 1]));
    });
  });
  test('reduce', () {
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n, accumulator: 0),
        equals(3));
    expect(flodash.reduce([1, 2], (sum, n, i) => sum + n), equals(3));
  });
}
