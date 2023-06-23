import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.takeRight([1, 2, 3]), equals([3]));
  });
  test('n', () {
    expect(flodash.takeRight([1, 2, 3], n: 2), equals([2, 3]));
  });
  test('empty', () {
    expect(flodash.takeRight([], n: 3), equals([]));
  });
}
