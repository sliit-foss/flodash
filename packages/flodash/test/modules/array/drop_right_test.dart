import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.dropRight([1, 2, 3]), equals([1, 2]));
  });
  test('custom-length', () {
    expect(flodash.dropRight([1, 2, 3], n: 2), equals([1]));
  });
}
