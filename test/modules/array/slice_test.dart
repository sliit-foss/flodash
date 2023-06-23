import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.slice([1, 2, 3, 4], start: 2), equals([3, 4]));
  });
  test('end', () {
    expect(flodash.slice([1, 2, 3, 4], start: 2, end: 3), equals([3]));
  });
  test('negative-start', () {
    expect(flodash.slice([1, 2, 3, 4], start: -2), equals([3, 4]));
  });
  test('negative-end', () {
    expect(flodash.slice([1, 2, 3, 4], start: 1, end: -1), equals([2, 3]));
  });
}
