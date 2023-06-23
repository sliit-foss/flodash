import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.lastIndexOf([4, 6, 8, 6], 6), equals(3));
  });
  test('from-index', () {
    expect(flodash.lastIndexOf([4, 6, 8, 6], 6, fromIndex: 2), equals(1));
  });
  test('not-found', () {
    expect(flodash.lastIndexOf([4, 2, 8, 10, 6], 6, fromIndex: 2), equals(-1));
  });
}
