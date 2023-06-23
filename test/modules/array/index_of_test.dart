import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.indexOf([4, 6, 8, 10], 6), equals(1));
  });
  test('from-index', () {
    expect(flodash.indexOf([4, 6, 8, 6], 6, fromIndex: 2), equals(3));
  });
  test('not-found', () {
    expect(flodash.indexOf([4, 6, 8, 10], 6, fromIndex: 2), equals(-1));
  });
}
