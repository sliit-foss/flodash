import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('default', () {
    expect(flodash.reverse([1, 2, 3]), equals([3, 2, 1]));
  });
}
