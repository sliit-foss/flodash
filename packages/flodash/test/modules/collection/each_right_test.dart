import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
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
}
