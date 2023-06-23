import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('list', () {
    expect(flodash.some([1, -1, -3, -6], (value) => value > 0), equals(true));
    expect(
        flodash.some([-31, -1, -3, -6], (value) => value > 0), equals(false));
  });
  test('type equality', () {
    expect(flodash.some([1, "sdf", "d"], int), equals(true));
    expect(flodash.some([1, -1, -3, -6], String), equals(false));
    expect(flodash.some(["ab", 0, []], String), equals(true));
  });
  test('direct equality', () {
    expect(flodash.some([1, -1, -3, -6], 1), equals(true));
    expect(flodash.some([1, -1, -3, -6], 0), equals(false));
  });
}
