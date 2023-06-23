import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
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
    flodash.each({'a': 1, 'b': 2}, (value, key) => items.addAll([key, value]));
    expect(items, equals(['a', 1, 'b', 2]));
  });
}
