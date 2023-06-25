import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.without([2, 1, 2, 3], 1, 2), equals([3]));
  });
  test('empty', () {
    expect(flodash.without([2, 1, 2, 3]), equals([2, 1, 2, 3]));
  });
}
