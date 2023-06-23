import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('list', () {
    expect(flodash.size([1, 2, 3]), equals(3));
  });
  test('set', () {
    expect(flodash.size({1, 2, 3}), equals(3));
  });
  test('map', () {
    expect(flodash.size({'a': 1, 'b': 2}), equals(2));
  });
  test('string', () {
    expect(flodash.size('abc'), equals(3));
  });
}
