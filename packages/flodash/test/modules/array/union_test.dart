import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.union([2], [1, 2]), equals([2, 1]));
  });
  test('multiple', () {
    expect(flodash.union([2], [1, 2], [2, 3]), equals([2, 1, 3]));
  });
  test('empty', () {
    expect(flodash.union([2], []), equals([2]));
  });
}
