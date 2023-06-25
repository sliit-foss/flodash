import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.xor([2, 1], [2, 3]), equals([1, 3]));
  });
  test('multiple', () {
    expect(flodash.xor([2, 1], [2, 3], [3, 4]), equals([1, 4]));
  });
  test('empty', () {
    expect(flodash.xor([2, 1], []), equals([2, 1]));
  });
}
