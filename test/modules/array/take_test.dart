import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.take([1, 2, 3]), equals([1]));
  });
  test('n', () {
    expect(flodash.take([1, 2, 3], n: 2), equals([1, 2]));
  });
  test('empty', () {
    expect(flodash.take([], n: 3), equals([]));
  });
}
