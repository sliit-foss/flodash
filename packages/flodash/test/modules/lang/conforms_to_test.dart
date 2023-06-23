import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('null', () {
    expect(flodash.conformsTo(null, {}), equals(false));
  });
  test('empty', () {
    expect(flodash.conformsTo({}, {}), equals(true));
  });
  test('map', () {
    expect(flodash.conformsTo({'a': 1}, {'a': (v) => v == 1}), equals(true));
    expect(flodash.conformsTo({'a': 1}, {'a': (v) => v == 2}), equals(false));
  });
  test('list', () {
    expect(flodash.conformsTo([1, 4, 5, 3, 8], [1, 4, 5, 3, (v) => v == 8]),
        equals(true));
    expect(flodash.conformsTo([2, 4, 6], [2, 2, (v) => v == 6]), equals(false));
  });
}
