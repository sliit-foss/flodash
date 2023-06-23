import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.intersection([2, 1], [2, 3]), equals([2]));
  });
  test('multiple', () {
    expect(flodash.intersection([2, 1], [2, 3], [2, 4]), equals([2]));
  });
  test('no-intersections', () {
    expect(flodash.intersection([2, 1], [6, 3], [2, 0]), equals([]));
  });
}
