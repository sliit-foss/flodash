import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.tail([1, 2, 3]), equals([2, 3]));
  });
  test('empty', () {
    expect(flodash.tail([]), equals([]));
  });
}
