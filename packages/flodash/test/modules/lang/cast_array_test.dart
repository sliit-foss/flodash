import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('null', () {
    expect(flodash.castArray(null), equals([null]));
  });
  test('empty', () {
    expect(flodash.castArray([]), equals([]));
  });
  test('list', () {
    expect(flodash.castArray([1]), equals([1]));
  });
  test('map', () {
    expect(
        flodash.castArray({'a': 1}),
        equals([
          {'a': 1}
        ]));
  });
  test('primitive', () {
    expect(flodash.castArray('a'), equals(['a']));
  });
}
