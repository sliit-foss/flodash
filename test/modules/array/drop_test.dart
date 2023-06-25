import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.drop([1, 2, 3]), equals([2, 3]));
  });
  test('custom-length', () {
    expect(flodash.drop([1, 2, 3], n: 2), equals([3]));
  });
}
